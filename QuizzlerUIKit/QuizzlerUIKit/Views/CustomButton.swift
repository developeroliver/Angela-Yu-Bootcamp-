//
//  button.swift
//  QuizzlerUIKit
//
//  Created by olivier geiger on 01/06/2023.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LAYOUT FUNCTIONS
    private func configure() {
        layer.borderWidth = 7
        layer.borderColor = UIColor(named: "borderColor")?.cgColor
        layer.cornerRadius = 20
        setTitleColor(.white, for: .normal)    }

}
