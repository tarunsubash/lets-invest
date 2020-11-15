//
//  CategoryTableViewCell.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {
    
    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    var categoryColor: UIColor = UIColor()
    
    var baseView = UIView()

    public func configureCell(categoryModel: CategoryModel) {
        categoryImageView.image = UIImage(systemName: categoryModel.categoryImageName)
        categoryTitleLabel.text = categoryModel.categoryTitle
        self.categoryColor = categoryModel.categoryColor
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(baseView)
        baseView.backgroundColor = categoryColor
        baseView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(70)
        }
        baseView.layer.cornerRadius = 35
        baseView.layer.masksToBounds = true
        baseView.addSubview(categoryImageView)
        categoryImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(45)
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
        baseView.addSubview(categoryTitleLabel)
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(categoryImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
