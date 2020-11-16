//
//  TrendingStocksTableViewCell.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit
import SnapKit

class TrendingStocksTableViewCell: UITableViewCell {
    
    lazy var stockTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var stockSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var stockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var stockDifferenceValueLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        selectionStyle = .none
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        contentView.addSubview(stockTitleLabel)
        contentView.addSubview(stockSubTitleLabel)
        contentView.addSubview(stockImageView)
        contentView.addSubview(stockDifferenceValueLabel)
        
        stockImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        stockTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stockImageView.snp.top)
            make.leading.equalTo(stockImageView.snp.trailing).offset(10)
        }
        
        stockSubTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stockImageView.snp.bottom).offset(-15)
            make.leading.equalTo(stockImageView.snp.trailing).offset(10)
        }
        
        stockDifferenceValueLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.equalTo(75)
            make.height.equalTo(30)
        }
    }
    
    public func configureCell(with model: StockModel) {
        stockTitleLabel.text = model.stockTitle
        stockSubTitleLabel.text = model.stockSubTitle
        stockDifferenceValueLabel.text = model.stockValue
        if model.stockValue.contains("-") {
            stockDifferenceValueLabel.backgroundColor = .red
        } else {
            stockDifferenceValueLabel.backgroundColor = .systemGreen
        }
        stockImageView.image = UIImage(systemName: model.stockImageName)
    }
}
