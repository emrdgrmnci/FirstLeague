//
//  SceneDelegate.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Initialize root view controller in the same way as all other
        // MVVM modules using builders
        guard let _ = (scene as? UIWindowScene) else { return }
        ((window?.rootViewController as? UITabBarController)?.viewControllers?.first as? UINavigationController)?.viewControllers = [MainViewControllerBuilder.make()]
        ((window?.rootViewController as? UITabBarController)?.viewControllers![1] as? UINavigationController)?.viewControllers = [ResultViewControllerBuilder.make()]
    }
}

