//
//  ViewController.swift
//  EggTimerUIKit
//
//  Created by olivier geiger on 30/05/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var progressView: UIProgressView!
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var onTap: (() -> Void)?
    var progressValue = 0.0

    private let labelView: UILabel = {
        let label                = UILabel()
        label.text                      = "How do you like your eggs ?"
        label.textColor                 = .label
        label.font                      = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let softButton      = EggButton(title: "soft", backgroundImage: UIImage(named: "soft_egg"))
    private let mediumButton    = EggButton(title: "medium", backgroundImage: UIImage(named: "medium_egg"))
    private let hardButton      = EggButton(title: "hard", backgroundImage: UIImage(named: "hard_egg"))
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func buttonClicked(sender: UIButton) {
      let eggTimes = ["soft": 3, "medium": 4, "hard": 7]
      let progressViewWidth: CGFloat = 200.0
      let progressViewHeight: CGFloat = 20.0

      progressView = UIProgressView(progressViewStyle: .default)
        
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -140),
                    progressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                    progressView.heightAnchor.constraint(equalToConstant: 8),
                ])

      progressView.progress = 0.0
      progressView.progressTintColor = .orange
      view.addSubview(progressView)

      timer.invalidate()
      let hardness = sender.currentTitle!
      print(hardness)
      totalTime = eggTimes[hardness]!
      secondsPassed = 0

      labelView.text = hardness.uppercased()

      timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

      sender.alpha = 0.5
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
        //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
      }
    }
    
    
    @objc func updateTimer() {
      if secondsPassed < totalTime {
        secondsPassed += 1
        progressView.setProgress(Float(secondsPassed) / Float(totalTime), animated: true)
      } else {
        timer.invalidate()
        labelView.text = "DONE!"
          labelView.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        progressView.progress = 0.0
      }
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureLabelView()
        configureStackView()
    }
    
    
    private func configureLabelView() {
        view.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureStackView() {
        let stackView = UIStackView()
        stackView.axis          = .horizontal
        stackView.spacing       = 20
        stackView.distribution  = .fillEqually
        
        stackView.addArrangedSubview(softButton)
        stackView.addArrangedSubview(mediumButton)
        stackView.addArrangedSubview(hardButton)
        
        softButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            softButton.widthAnchor.constraint(equalToConstant: 110),
            softButton.heightAnchor.constraint(equalToConstant: 140),
            
            mediumButton.widthAnchor.constraint(equalToConstant: 110),
            mediumButton.heightAnchor.constraint(equalToConstant: 140),
            
            hardButton.widthAnchor.constraint(equalToConstant: 110),
            hardButton.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
    
}

