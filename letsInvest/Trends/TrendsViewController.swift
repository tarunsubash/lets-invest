//
//  TrendingViewController.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class TrendsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        title = "Trending"
        createHorizontalScrollView()
    }
    
    func createHorizontalScrollView() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 60))
        
        var buttonX: Int = 0
        
        for i in 0...5 {
            var button = UIButton(frame: CGRect(x: buttonX, y: 0, width: 100, height: 60))
            button.setTitle("Button \(i)", for: .normal)
            scrollView.addSubview(button)
            button.tintColor = .white
            buttonX = buttonX + 100
        }
        scrollView.contentSize = CGSize(width: buttonX, height: 60)
        scrollView.backgroundColor = .cyan
        view.addSubview(scrollView)
    }
}
