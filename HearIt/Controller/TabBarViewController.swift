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
        view.backgroundColor = UIColor.purpleColor
        tabBar.tintColor = UIColor.purpleColor
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
