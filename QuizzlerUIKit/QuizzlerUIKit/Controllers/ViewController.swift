//
//  ViewController.swift
//  QuizzlerUIKit
//
//  Created by olivier geiger on 01/06/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var progressView: UIProgressView!
    var currentStep: Float = 0
    var quizBrain = QuizBrain()
    var score: Int = 0
    var questionNumber: Int = 0
    
    private let titleLabelView: UILabel = {
        let label           = UILabel()
        label.text          = "Swift Quizz"
        label.textColor     = .white
        label.font          = UIFont.systemFont(ofSize: 40, weight: .heavy)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private let scoreLabelView: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor     = .systemGreen
        label.font          = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let questionLabelView: UILabel = {
        let label           = UILabel()
        label.text          = "Question Text"
        label.font          = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor     = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let trueButton = CustomButton(title: "Vrai")
    
    private let falseButton = CustomButton(title: "Faux")
    
    private let imageView: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = UIImage(named: "Background-Bubbles")
        imageView.contentMode   = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        questionLabelView.text = quizBrain.getQuestionText()
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func answerButton(sender: UIButton) {
        let userAnswer = sender.currentTitle!
        print(userAnswer)
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        print(userGotItRight)
        
        print(userGotItRight)
        
        if userGotItRight {
            sender.backgroundColor = .systemGreen
            score += 1
            questionNumber += 1
        } else {
            sender.backgroundColor = .systemRed
            questionNumber += 1
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        updateProgress()
        
    }
    
    
    // MARK: - FUNCTIONS
    @objc private func updateUI() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.questionLabelView.frame.origin.x += self.view.frame.width
        }, completion: nil)
        
        questionLabelView.text = quizBrain.getQuestionText()
        
        if questionNumber == 20 {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
                        self.scoreLabelView.frame.origin.y += self.view.frame.height + 50
                    }, completion: nil)
                    scoreLabelView.text = "Vous avez \(score) réponses correctes"
        }
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    private func updateProgress() {
        currentStep += 1
        let progress = currentStep / 20
        progressView.setProgress(progress, animated: true)
        
        if currentStep >= 20 {
            titleLabelView.text = "Quiz terminé!"
        }
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureTitleLabelView()
        configureScoreLabelView()
        configureQuestionsLableView()
        configureStackView()
        configureImageView()
    }
    
    
    private func configureTitleLabelView() {
        view.addSubview(titleLabelView)
        
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureScoreLabelView() {
        view.addSubview(scoreLabelView)
        
        NSLayoutConstraint.activate([
            scoreLabelView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: 10),
            scoreLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureQuestionsLableView() {
        view.addSubview(questionLabelView)
        
        NSLayoutConstraint.activate([
            questionLabelView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            questionLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    
    private func configureStackView() {
        let stackView           = UIStackView()
        stackView.axis          = .vertical
        stackView.spacing       = 10
        stackView.distribution  = .fillProportionally
        
        progressView = UIProgressView(progressViewStyle: .default)
        
        stackView.addArrangedSubview(trueButton)
        stackView.addArrangedSubview(falseButton)
        stackView.addArrangedSubview(progressView)
        
        trueButton.addTarget(self, action: #selector(answerButton(sender:)), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(answerButton(sender:)), for: .touchUpInside)
        
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            trueButton.heightAnchor.constraint(equalToConstant: 80),
            falseButton.heightAnchor.constraint(equalToConstant: 80),
            
            progressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            progressView.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        progressView.progress = 0
    }
    
    
    private func configureImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

