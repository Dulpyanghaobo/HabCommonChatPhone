//
//  SceneDelegate.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/1.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        let tabBarVc = HABBaseTabBarController()
        window?.rootViewController = tabBarVc
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if (HABUserManager.shared.userInfo?.token.isEmpty == true) {
            let login = HABLoginController()
            let navigationVC = HABBaseNavigationController(rootViewController: login)
            window?.rootViewController = navigationVC
            window?.makeKeyAndVisible()
        } else {
            let tabBarVc = HABBaseTabBarController()
            window?.rootViewController = tabBarVc
            window?.makeKeyAndVisible()
        }
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}

