//
//  SceneDelegate.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: ExchangeRateViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

