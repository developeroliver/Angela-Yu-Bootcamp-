//
//  ViewController.swift
//  DiceeUIKit
//
//  Created by olivier geiger on 28/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    private let backgroundImageView: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "GreenBackground")
        imageView.contentMode   = .scaleAspectFill
        
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "DiceeLogo")
        imageView.contentMode   = .scaleAspectFit
        
        return imageView
    }()
    
    private let diceeOne: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "DiceOne")
        imageView.contentMode   = .scaleAspectFit
        
        return imageView
    }()
    
    private let diceeTwo: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "DiceTwo")
        imageView.contentMode   = .scaleAspectFit
        
        return imageView
    }()
    
    private let rollButton: UIButton = {
        let button                  = UIButton(type: .system)
        button.backgroundColor      = UIColor(named: "RollColor")
        button.layer.cornerRadius   = 10
        button.setTitle("Roll", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleRollTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func handleRollTapped() {
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        diceeOne.image = diceArray[Int.random(in: 0...5)]
        diceeTwo.image = diceArray[Int.random(in: 0...5)]
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureBackgroundImage()
        configureLogoImageView()
        configureStackView()
        configureRollButton()
    }
    
    
    
    private func configureBackgroundImage() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.frame = view.bounds
    }
    
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    
    private func configureStackView() {
        let stackView = UIStackView()
        stackView.axis      = .horizontal
        stackView.spacing   = 30
        
        stackView.addArrangedSubview(diceeOne)
        stackView.addArrangedSubview(diceeTwo)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 150),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureRollButton() {
        view.addSubview(rollButton)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: 200),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

