//
//  TabBarViewController.swift
//  HearIt
//
//  Created by Siddique on 11/03/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        let purple = UIColor(red: 85.0/255, green: 37.0/255, blue: 131.0/255, alpha: 1.0)
        view.backgroundColor = purple
        tabBar.tintColor = purple
        setUpViewController()
    }
    func setUpViewController() {
        viewControllers = [
            generateNavigationController(for: SearchViewController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(for: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    private func generateNavigationController(for rootViewController: UIViewController,
    title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
