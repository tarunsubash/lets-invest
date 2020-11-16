//
//  TableViewController.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class TrendingStocksTableViewController: UITableViewController {
    private let viewModel: TrendingStocksViewModel
    private let sectionHeaderHeight: CGFloat = 25.00

    init(viewModel: TrendingStocksViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(viewModel: TrendingStocksViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(TrendingStocksTableViewCell.self,
                           forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return TrendingStockSection.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = TrendingStockSection(rawValue: section), let sectionData = viewModel.trendingStocks[tableSection] else { return 0 }
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: sectionHeaderHeight))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x:15, y:0, width: tableView.bounds.width - 30, height: sectionHeaderHeight))
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        if let tableSection = TrendingStockSection(rawValue: section) {
            switch tableSection {
            case .topSellers:
                label.text = "Top Sellers"
            case .topGainers:
                label.text = "Top Gainers"
            case .topLosers:
                label.text = "Top Loser"
            case .activeByVolume:
                label.text = "Active by Volume"
            }
        }
        
        view.addSubview(label)
        return view
        
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    override func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        guard let tableSection = TrendingStockSection(rawValue: section), let sectionData = viewModel.trendingStocks[tableSection], sectionData.count > 0 else { return 0 }
        return sectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TrendingStocksTableViewCell
        if let tableSection = TrendingStockSection(rawValue: indexPath.section),
            let stockModel = viewModel.trendingStocks[tableSection]?[indexPath.row] {
            cell.configureCell(with: stockModel)
        }
        return cell
    }
}
