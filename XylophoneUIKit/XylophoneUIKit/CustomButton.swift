//
//  CustomButton.swift
//  XylophoneUIKit
//
//  Created by olivier geiger on 29/05/2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
    }

}
