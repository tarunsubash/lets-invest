//
//  ThemesCollectionViewController.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ThemesCollectionViewController: UIViewController {
    var themesCollectionView: UICollectionView?
    let themesViewModel: ThemesViewable
    init(themesViewModel: ThemesViewable) {
        self.themesViewModel = themesViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(themesViewModel: ThemesViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 10, right: 25)
        layout.itemSize = CGSize(width: self.view.frame.size.width * 0.4,
                                 height: 150)
        layout.minimumInteritemSpacing = 10
        
        themesCollectionView = UICollectionView(frame: self.view.frame,
                                                collectionViewLayout: layout)
        
        themesCollectionView?.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        themesCollectionView?.backgroundColor = .white
        
        themesCollectionView?.dataSource = self
        
        view.addSubview(themesCollectionView ?? UICollectionView())
        self.view = view
    }
}

extension ThemesCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        themesViewModel.numberOfThemes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ThemesCollectionViewCell
        cell.configureCell(with: themesViewModel.themesList()[indexPath.item])
        return cell
    }
}
