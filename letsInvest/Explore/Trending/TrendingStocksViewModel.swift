//
//  TrendingStocksViewModel.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Foundation

enum TrendingStockSection: Int, CaseIterable {
    case topGainers = 0
    case topLosers = 1
    case topSellers = 2
    case activeByVolume = 3
}

class TrendingStocksViewModel {
    var trendingStocks: [TrendingStockSection: [StockModel]] = [:]
    
    init() {
        sortData()
    }
    
    func sortData() {
        trendingStocks[.topGainers] = popualteData().filter { $0.stockCategory == .topGainers }
        trendingStocks[.topLosers] = popualteData().filter { $0.stockCategory == .topLosers }
        trendingStocks[.topSellers] = popualteData().filter { $0.stockCategory == .topSellers }
        trendingStocks[.activeByVolume] = popualteData().filter { $0.stockCategory == .activeByVolume }
    }
    
    private func popualteData() -> [StockModel] {
        var data: [StockModel] = []
        
        data.append(StockModel(stockTitle: "Slack",
                               stockSubTitle: "WORK",
                               stockImageName: "pencil.circle",
                               stockValue: "+10.15",
                               stockCategory: .topGainers))
        data.append(StockModel(stockTitle: "Medifast",
                               stockSubTitle: "MEDI",
                               stockImageName: "plus.circle",
                               stockValue: "+20.25",
                               stockCategory: .topGainers))
        data.append(StockModel(stockTitle: "Pintrest",
                               stockSubTitle: "PINS",
                               stockImageName: "pin.circle",
                               stockValue: "+12.15",
                               stockCategory: .topGainers))
        data.append(StockModel(stockTitle: "Evoqua Water",
                               stockSubTitle: "AQUA",
                               stockImageName: "mic.circle",
                               stockValue: "+9.15",
                               stockCategory: .topGainers))
        
        data.append(StockModel(stockTitle: "Evoqua Water",
                               stockSubTitle: "AQUA",
                               stockImageName: "mic.circle",
                               stockValue: "+9.71%",
                               stockCategory: .topSellers))
        data.append(StockModel(stockTitle: "Slack",
                               stockSubTitle: "WORK",
                               stockImageName: "pencil.circle",
                               stockValue: "+2.35%",
                               stockCategory: .topSellers))
        
        data.append(StockModel(stockTitle: "ZATech",
                               stockSubTitle: "ZXY",
                               stockImageName: "multiply.circle",
                               stockValue: "-20.11",
                               stockCategory: .topLosers))
        data.append(StockModel(stockTitle: "UTechS",
                               stockSubTitle: "UTS",
                               stockImageName: "mic.circle",
                               stockValue: "-70.88",
                               stockCategory: .topLosers))
        
        data.append(StockModel(stockTitle: "FTechSol",
                               stockSubTitle: "FTS",
                               stockImageName: "mic.circle.fill",
                               stockValue: "+15%",
                               stockCategory: .activeByVolume))
        
        
        return data
    }
}
