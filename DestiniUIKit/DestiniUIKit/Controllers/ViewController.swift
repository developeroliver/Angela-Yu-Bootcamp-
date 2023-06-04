//
//  ViewController.swift
//  DestiniUIKit
//
//  Created by olivier geiger on 04/06/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - PROPERTIES
    var storyBrain = StoryBrain()
    
    private let backgroundImageView: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label           = UILabel()
        label.text          = "Story Text"
        label.textColor     = .white
        label.font          = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let choiceOnebutton = CustomButton(backgroundColor: UIColor(named: "choice1")!, title: "Choice 1")
    
    let choiceTwobutton = CustomButton(backgroundColor: UIColor(named: "choice2")!, title: "Choice 2")
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func choiceMade(sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        sender.alpha = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   sender.alpha = 1.0
               }
        updateUI()
    }
    
    
    // MARK: - FUNCTIONS
    private func updateUI() {
        textLabel.text = storyBrain.getStoryTitle()
        choiceOnebutton.setTitle(storyBrain.getChoice1(), for: .normal)
        choiceTwobutton.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureBackgroundImageView()
        confiureTextLabel()
        configureStackView()
    }
    
    
    private func configureBackgroundImageView() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.frame = view.bounds
    }
    
    
    private func confiureTextLabel() {
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    
    private func configureStackView() {
        let stackView           = UIStackView()
        stackView.axis          = .vertical
        stackView.spacing       = 20
        stackView.distribution  = .fillProportionally
        
        stackView.addArrangedSubview(choiceOnebutton)
        stackView.addArrangedSubview(choiceTwobutton)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.text = storyBrain.getStoryTitle()
        choiceOnebutton.setTitle(storyBrain.getChoice1(), for: .normal)
        choiceTwobutton.setTitle(storyBrain.getChoice2(), for: .normal)
        
        choiceOnebutton.addTarget(self, action: #selector(choiceMade(sender:)), for: .touchUpInside)
        choiceTwobutton.addTarget(self, action: #selector(choiceMade(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            choiceOnebutton.heightAnchor.constraint(equalToConstant: 100),
            choiceTwobutton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

}

