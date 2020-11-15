//
//  ThemesCollectionViewCell.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    private lazy var themeImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var themeTitleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(red: 250, green: 251, blue: 252, alpha: 1)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        contentView.addSubview(themeImageView)
        contentView.addSubview(themeTitleLabel)
        
        themeImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(75)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
        
        themeTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(themeImageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        
        contentView.layer.cornerRadius = 2.5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    public func configureCell(with themesModel: ThemesModel) {
        themeImageView.image = UIImage(systemName: themesModel.themeImageName)
        themeTitleLabel.text = themesModel.themeTitle
    }
}
