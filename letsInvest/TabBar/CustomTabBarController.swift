//
//  CustomTabBarController.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private let viewControllerFactory: ViewControllerFactory
    
    init(viewControllerFactory: ViewControllerFactory = ViewControllerFactoryImpl()) {
        self.viewControllerFactory = viewControllerFactory
        
        let homeVc = UINavigationController(rootViewController: HomeViewController())
        homeVc.title = "Home"
        homeVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: nil)
        
        let searchVc = UINavigationController(rootViewController: ExploreViewController(viewControllerFactory: viewControllerFactory))
        searchVc.title = "Explore"
        searchVc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let trendingVc = UINavigationController(rootViewController: TrendsViewController())
        trendingVc.title = "Trending"
        trendingVc.tabBarItem.image = UIImage(systemName: "waveform.circle")
        
        let profileVc = UINavigationController(rootViewController: ProfileViewController())
        profileVc.title = "Profile"
        profileVc.tabBarItem.image = UIImage(systemName: "person.2")
        
        let insightsVc = UINavigationController(rootViewController: InsightsViewController())
        insightsVc.title = "Insights"
        insightsVc.tabBarItem.image = UIImage(systemName: "lightbulb")
        
        super.init(nibName: nil, bundle: nil)
        
        setViewControllers([homeVc,
                            searchVc,
                            trendingVc,
                            profileVc,
                            insightsVc], animated: false)
        
        removeTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeTitle() {
        for tabBarItem in tabBar.items ?? [] {
            tabBarItem.title = ""
        }
    }
    
}
