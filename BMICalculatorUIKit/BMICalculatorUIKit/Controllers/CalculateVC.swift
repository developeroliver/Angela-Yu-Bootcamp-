//
//  CalculateVC.swift
//  BMICalculatorUIKit
//
//  Created by olivier geiger on 05/06/2023.
//

import UIKit

class CalculateVC: UIViewController {
    
    // MARK: - PROPERTIES
    var calculatorBrain = CalculatorBrain()
    
    var weightStackView: UIStackView!
    var heightStackView: UIStackView!
    var heightSlider: UISlider!
    var weightSlider: UISlider!
    
    private let backgroundImage: UIImageView = {
        let imageView               = UIImageView()
        imageView.image             = UIImage(named: "calculate_background")
        imageView.contentMode       = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let calculateButton: UIButton = {
        let button                  = UIButton(type: .system)
        button.backgroundColor      = UIColor(named: "purpleColor")
        button.layer.cornerRadius   = 10
        button.titleLabel?.font     = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("CALCULATE", for: .normal)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label           = UILabel()
        label.text          = "CALCULATE \nYOUR BMI"
        label.textColor     = .darkGray
        label.font          = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let heightTitleLabel: UILabel = {
        let label       = UILabel()
        label.text      = "Height"
        label.textColor = .darkGray
        label.font      = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let heightMLabel: UILabel = {
        let label       = UILabel()
        label.text      = "1.5m"
        label.textColor = .darkGray
        label.font      = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let weightTitleLabel: UILabel = {
        let label       = UILabel()
        label.text      = "Weight"
        label.textColor = .darkGray
        label.font      = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let weightKGLabel: UILabel = {
        let label       = UILabel()
        label.text      = "70Kg"
        label.textColor = .darkGray
        label.font      = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    
    // MARK: HELPERS
    @objc func sliderHeightValueChanged(sender: UISlider) {
        let value           = String(format: "%.2f", sender.value)
        heightMLabel.text   = "\(value)m"
    }
    
    
    @objc func sliderWeightValueChanged(sender: UISlider) {
        let value           = String(format: "%.0f", sender.value)
        weightKGLabel.text  = "\(value)Kg"
    }
    
    
    @objc func calculatePressed(sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
       
        let controller = ResultVC()
        controller.bmiValue = calculatorBrain.getBMIValue()
        controller.advice   = calculatorBrain.getAdvice()
        controller.color    = calculatorBrain.getColor()
        present(controller, animated: true)
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureBackgroundImageView()
        configureTitleLabel()
        configureHeightStackView()
        configureWeightStackView()
        configureStackView()
    }
    
    
    private func configureBackgroundImageView() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    
    private func configureHeightStackView() {
        heightStackView                 = UIStackView()
        
        heightStackView.axis            = .horizontal
        heightStackView.alignment       = .center
        heightStackView.distribution    = .fill
        
        // Ajout de la UIStackView à la vue principale
        heightStackView.addArrangedSubview(heightTitleLabel)
        heightStackView.addArrangedSubview(heightMLabel)
        view.addSubview(heightStackView)
        
        // Définition des contraintes pour la UIStackView
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heightStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    private func configureWeightStackView() {
        weightStackView                 = UIStackView(arrangedSubviews: [weightTitleLabel, weightKGLabel])
        
        weightStackView.axis            = .horizontal
        weightStackView.alignment       = .center
        weightStackView.distribution    = .fill
        
        // Ajout de la UIStackView à la vue principale
        view.addSubview(weightStackView)
        
        // Définition des contraintes pour la UIStackView
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    private func configureStackView() {
        let stackView   = UIStackView()
        heightSlider    = UISlider()
        weightSlider    = UISlider()
        
        heightSlider.minimumValue           = 0
        heightSlider.maximumValue           = 2.20
        heightSlider.value                  = 1.50
        heightSlider.thumbTintColor         = UIColor(named: "purpleColor")
        heightSlider.minimumTrackTintColor  = UIColor(named: "purpleColor")
        heightSlider.maximumTrackTintColor  = UIColor.lightGray
       
        
        weightSlider.minimumValue           = 0
        weightSlider.maximumValue           = 220
        weightSlider.value                  = 70
        weightSlider.thumbTintColor         = UIColor(named: "purpleColor")
        weightSlider.minimumTrackTintColor  = UIColor(named: "purpleColor")
        weightSlider.maximumTrackTintColor  = UIColor.lightGray
        
        heightSlider.addTarget(self, action: #selector(sliderHeightValueChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(sliderWeightValueChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculatePressed(sender:)), for: .touchUpInside)
        
        stackView.axis          = .vertical
        stackView.spacing       = 20
        stackView.distribution  = .fillProportionally
        
        stackView.addArrangedSubview(heightStackView)
        stackView.addArrangedSubview(heightSlider)
        stackView.addArrangedSubview(weightStackView)
        stackView.addArrangedSubview(weightSlider)
        stackView.addArrangedSubview(calculateButton)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    
}

