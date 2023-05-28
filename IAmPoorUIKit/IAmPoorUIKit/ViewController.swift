//
//  ViewController.swift
//  IAmPoorUIKit
//
//  Created by olivier geiger on 27/05/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - PROPERTIES
    private let labelView: UILabel = {
        let label       = UILabel()
        label.text      = "I Am Poor"
        label.textColor = .white
        label.font      = UIFont.systemFont(ofSize: 40, weight: .regular)
        
        return label
    }()
    
    private let imageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "coal")
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        configure()
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        configureLabelView()
        configureImageView()
    }
    
    
    private func configureLabelView() {
        view.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 213),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 270),
            imageView.heightAnchor.constraint(equalToConstant: 270),
        ])
    }

}

