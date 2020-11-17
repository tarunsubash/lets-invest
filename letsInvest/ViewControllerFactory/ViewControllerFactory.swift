//
//  ViewControllerFactory.swift
//  letsInvest
//
//  Created by Subash on 17/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
    func getTrendingViewController() -> UIViewController
    func getThemesViewController() -> UIViewController
    func getCategoryViewController() -> UIViewController
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    
    func getCategoryViewController() -> UIViewController {
        return CategoryTableViewController()
    }
    
    func getThemesViewController() -> UIViewController {
        return ThemesCollectionViewController()
    }
    
    func getTrendingViewController() -> UIViewController {
        return TrendingStocksTableViewController()
    }
}
