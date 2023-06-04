//
//  CustomButton.swift
//  DestiniUIKit
//
//  Created by olivier geiger on 04/06/2023.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 20
        
        translatesAutoresizingMaskIntoConstraints = false
    }

}
