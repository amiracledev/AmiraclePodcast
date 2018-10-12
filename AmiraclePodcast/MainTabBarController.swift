//
//  MainTabBarController.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/11/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true

        tabBar.tintColor = .blue
        
        
        
        let searchNavController = UINavigationController(rootViewController: ViewController())
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        
   
        
        setupViewControllers()
    }
    
    //MARK:- Setup Functions
    
    
    fileprivate func setupViewControllers() {
        let downloadImage = UIImage(named: "downloads")
        let searchImage = UIImage(named: "search")
        let favImage = UIImage(named: "favorites")
        viewControllers = [generateNavController(with: PodcastsSearchController(), title: "Search", image: searchImage!),generateNavController(with: ViewController(), title: "Downloads", image: downloadImage!), generateNavController(with: ViewController(), title: "Favorites", image: favImage!)]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
    
}
