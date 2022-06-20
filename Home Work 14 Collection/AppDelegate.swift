//
//  AppDelegate.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .gray
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        
        let thirdViewController = CollectionViewController()
        let navigationController = UINavigationController(rootViewController: thirdViewController)
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        thirdViewController.view.backgroundColor = .systemBackground
        
        let fourthViewController = UIViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tabBarController.setViewControllers([
            firstViewController,
            secondViewController,
            navigationController,
            fourthViewController
        ], animated: true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}
