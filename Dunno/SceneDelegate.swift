//
//  SceneDelegate.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let vc = SubjectListViewController()
        let navVC = UINavigationController(rootViewController: vc)
        vc.setAppNavigationBar(title: "Active tests")
        window?.rootViewController = navVC
//        if UserData.shared.authToken.isEmpty {
//            window?.rootViewController = LoginViewController()
//        } else {
           
//        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

