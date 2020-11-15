//
//  CategoryModel.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Foundation
import UIKit

struct CategoryModel {
    init(categoryTitle: String, categoryImageName: String, categoryColor: UIColor) {
        self.categoryTitle = categoryTitle
        self.categoryImageName = categoryImageName
        self.categoryColor = categoryColor
    }
    
    let categoryTitle: String
    let categoryImageName: String
    let categoryColor: UIColor
}
