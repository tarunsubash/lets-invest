//
//  ExploreViewController.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class ExploreViewController: UIPageViewController {
    var pages: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        title = "Explore"
    }
    private let viewControllerFactory: ViewControllerFactory
    
    init(viewControllerFactory: ViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
        dataSource = self
        addViewControllersToPages()
        setViewControllers([pages[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViewControllersToPages() {
        pages.append(viewControllerFactory.getCategoryViewController())
        pages.append(viewControllerFactory.getThemesViewController())
        pages.append(viewControllerFactory.getThemesViewController())
    }
}

extension ExploreViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let vcIndex = pages.firstIndex(of: viewController) {
            if vcIndex == 0 {
                return pages.last
            } else {
                return pages[vcIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let vcIndex = pages.firstIndex(of: viewController) {
            if vcIndex < self.pages.count - 1 {
                return pages[vcIndex + 1]
            } else {
                return pages.first
            }
        }
        return nil
    }
}

class ViewControllerFactory {
    
    func getCategoryViewController() -> UIViewController {
        return CategoryTableViewController()
    }
    
    func getThemesViewController() -> UIViewController {
        return CategoryTableViewController()
    }
    
    func getTrendingViewController() -> UIViewController {
        return CategoryTableViewController()
    }
}
