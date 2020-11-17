//
//  ExploreViewController.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Parchment
import SnapKit
import UIKit

class ExploreViewController: UIViewController {
    var pages: [UIViewController] = []
    private let viewControllerFactory: ViewControllerFactory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Explore"
        setUpNavigationBar()
        let pagingViewController = PagingViewController(viewControllers: childViewControllers())
        setUpPaging(pagingViewController)
    }
    
    init(viewControllerFactory: ViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpPaging(_ pagingViewController: PagingViewController) {
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pagingViewController.menuItemSize = .sizeToFit(minWidth: 40, height: 50)
        pagingViewController.menuItemSpacing = 10
        pagingViewController.menuTransition = .scrollAlongside
        pagingViewController.indicatorClass = PagingIndicatorView.self
        pagingViewController.indicatorColor = .purple
        pagingViewController.selectedTextColor = .purple
        pagingViewController.view.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(80)
        }
    }
    
    private func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
    }
    
    private func childViewControllers() -> [UIViewController] {
        var vc: [UIViewController] = []
        vc.append(viewControllerFactory.getCategoryViewController())
        vc.append(viewControllerFactory.getThemesViewController())
        vc.append(viewControllerFactory.getTrendingViewController())
        return vc
    }
}
