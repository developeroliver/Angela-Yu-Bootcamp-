//
//  ResultVC.swift
//  BMICalculatorUIKit
//
//  Created by olivier geiger on 05/06/2023.
//

import UIKit

class ResultVC: UIViewController {

    // MARK: - PROPERTIES
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    private let backgroundImage: UIImageView = {
        let imageView               = UIImageView()
        imageView.image             = UIImage(named: "result_background")
        imageView.contentMode       = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label           = UILabel()
        label.text          = "YOUR RESULT"
        label.font          = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor     = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bmiLabel: UILabel = {
        let label           = UILabel()
        label.text          = "0.0"
        label.font          = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.textColor     = .white
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let adviceLabel: UILabel = {
        let label           = UILabel()
        label.text          = "EAT SOME MORE SNACKS!"
        label.font          = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor     = .white
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let recalculateButton: UIButton = {
        let button                  = UIButton(type: .system)
        button.backgroundColor      = UIColor.white
        button.titleLabel?.font     = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(UIColor(named: "purpleColor"), for: .normal)
        button.setTitle("RECALCULATE", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = color
        
        bmiLabel.text           = bmiValue
        adviceLabel.text        = advice
        
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func recalculatePressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureBackgroundImageView()
        configureTitleLabel()
        configureBmiLabel()
        configureAdviceLabel()
        configureRecalculateButton()
    }
    
    
    private func configureBackgroundImageView() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureBmiLabel() {
        view.addSubview(bmiLabel)
        
        NSLayoutConstraint.activate([
            bmiLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureAdviceLabel() {
        view.addSubview(adviceLabel)
        
        NSLayoutConstraint.activate([
            adviceLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 10),
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    private func configureRecalculateButton() {
        view.addSubview(recalculateButton)
        
        recalculateButton.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}
