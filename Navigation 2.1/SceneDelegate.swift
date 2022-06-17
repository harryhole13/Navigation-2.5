//
//  SceneDelegate.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 12.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let myWindowScene = (scene as? UIWindowScene) else { return }
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        let tabBar = UITabBarController()
        let feed = UIViewController()
        //feed.viewDidLoad()
        feed.view.backgroundColor = .green
        
        let profile = UINavigationController(rootViewController: ProfileViewController())
        
        tabBar.setViewControllers([
        feed,
        profile
        ], animated: true)
        tabBar.tabBar.backgroundColor = .white
        feed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        window = UIWindow(windowScene: myWindowScene)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

}

