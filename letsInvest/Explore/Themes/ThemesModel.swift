//
//  CollectionModel.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Foundation

struct ThemesModel {
    init(themeTitle: String, themeImageName: String) {
        self.themeTitle = themeTitle
        self.themeImageName = themeImageName
    }
    
    let themeTitle: String
    let themeImageName: String
}
