//
//  SceneDelegate.swift
//  BMICalculatorUIKit
//
//  Created by olivier geiger on 05/06/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window                      = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.rootViewController  = UINavigationController(rootViewController: CalculateVC())
        window?.makeKeyAndVisible()
        
    }
    
}