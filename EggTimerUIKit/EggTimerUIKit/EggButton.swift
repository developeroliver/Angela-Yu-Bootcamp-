//
//  EggButton.swift
//  EggTimerUIKit
//
//  Created by olivier geiger on 30/05/2023.
//

import UIKit

class EggButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(title: String, backgroundImage: UIImage?) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setBackgroundImage(backgroundImage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
    }

}
