//
//  ViewController.swift
//  DiceeUIKit
//
//  Created by olivier geiger on 28/05/2023.
//

import UIKit
import SwiftUI

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
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 130),
            imageView.heightAnchor.constraint(equalToConstant: 130),
        ])
        
        return imageView
    }()
    
    private let diceeTwo: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "DiceTwo")
        imageView.contentMode   = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 130),
            imageView.heightAnchor.constraint(equalToConstant: 130),
        ])
        
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
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
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
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),        ])
    }
    
    
    private func configureRollButton() {
        view.addSubview(rollButton)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: 200),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
