//
//  AMSceneDelegate.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMSceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties
    var window: UIWindow?

    // MARK: - UIWindowSceneDelegate
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = AMTabBarController()
        window.makeKeyAndVisible()
        window.tintColor = .systemPink
        self.window = window
    }
}
