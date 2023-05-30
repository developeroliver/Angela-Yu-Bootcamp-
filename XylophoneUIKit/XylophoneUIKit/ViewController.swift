//
//  ViewController.swift
//  XylophoneUIKit
//
//  Created by olivier geiger on 29/05/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - PROPERTIES
    var player: AVAudioPlayer!
    
    private let cButton = CustomButton(text: "C", backgroundColor: .systemRed)
    private let dButton = CustomButton(text: "D", backgroundColor: .systemOrange)
    private let eButton = CustomButton(text: "E", backgroundColor: .systemYellow)
    private let fButton = CustomButton(text: "F", backgroundColor: .systemGreen)
    private let gButton = CustomButton(text: "G", backgroundColor: .systemIndigo)
    private let aButton = CustomButton(text: "A", backgroundColor: .systemBlue)
    private let bButton = CustomButton(text: "B", backgroundColor: .systemPurple)
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func playSound(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        let url = Bundle.main.url(forResource: sender.currentTitle, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(cButton)
        stackView.addArrangedSubview(dButton)
        stackView.addArrangedSubview(eButton)
        stackView.addArrangedSubview(fButton)
        stackView.addArrangedSubview(gButton)
        stackView.addArrangedSubview(aButton)
        stackView.addArrangedSubview(bButton)
        
        cButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        dButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        eButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        fButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        gButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        aButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(playSound(sender:)), for: .touchUpInside)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            cButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            cButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            cButton.heightAnchor.constraint(equalToConstant: 110),
            
            dButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dButton.heightAnchor.constraint(equalToConstant: 110),
            
            eButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            eButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            eButton.heightAnchor.constraint(equalToConstant: 110),
            
            fButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            fButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            fButton.heightAnchor.constraint(equalToConstant: 110),
            
            gButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            gButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            gButton.heightAnchor.constraint(equalToConstant: 110),
            
            aButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            aButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            aButton.heightAnchor.constraint(equalToConstant: 110),
            
            bButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            bButton.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
    
    
    
}

