//
//  CategoryViewModel.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Foundation

protocol CategoryViewable {
    func numberOfCategories() -> Int
    func categories() -> [CategoryModel]
}

class CategoryViewModel: CategoryViewable {
    func numberOfCategories() -> Int {
        return categoryModels.count
    }
    
    func categories() -> [CategoryModel] {
        return categoryModels
    }
    
    var categoryModels: [CategoryModel] = []
    
    init() {
        addCategories()
    }
    
    private func addCategories() {
        categoryModels.append(CategoryModel(categoryTitle: "Stocks",
                                            categoryImageName: "dollarsign.circle",
                                            categoryColor: .purple))
        
        categoryModels.append(CategoryModel(categoryTitle: "ETFs",
                                            categoryImageName: "play.circle",
                                            categoryColor: .blue))
        
        categoryModels.append(CategoryModel(categoryTitle: "Crypto",
                                            categoryImageName: "bitcoinsign.circle",
                                            categoryColor: .orange))
    }
}
