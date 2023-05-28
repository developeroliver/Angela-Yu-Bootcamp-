//
//  ViewController.swift
//  Magic8BallUIKit
//
//  Created by olivier geiger on 28/05/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - PROPERTIES
    private let labelView: UILabel = {
        let label           = UILabel()
        label.text          = "Ask Me Anything..."
        label.font          = UIFont.systemFont(ofSize: 32)
        label.textColor     = .white
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = #imageLiteral(resourceName: "ball5")
        imageView.contentMode   = .scaleAspectFit
        
        return imageView
    }()
    
    private let askButton: UIButton = {
        let button                  = UIButton(type: .system)
        button.backgroundColor      = .white
        button.layer.cornerRadius   = 10
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleAskButton), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func handleAskButton() {
        let askArray = [#imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball5")]
        
        imageView.image = askArray[Int.random(in: 0...4)]
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureLabelView()
        configureImageView()
        configureAskButton()
    }

    
    private func configureLabelView() {
        view.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    private func configureAskButton() {
        view.addSubview(askButton)
        askButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.widthAnchor.constraint(equalToConstant: 120),
            askButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

