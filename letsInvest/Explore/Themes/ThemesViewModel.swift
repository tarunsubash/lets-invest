//
//  ThemesViewModel.swift
//  letsInvest
//
//  Created by Subash on 16/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import Foundation

protocol ThemesViewable {
    func numberOfThemes() -> Int
    func themesList() -> [ThemesModel]
}

class ThemesViewModel: ThemesViewable {
    var themes: [ThemesModel] = []
    
    func numberOfThemes() -> Int {
        themes.count
    }
    
    func themesList() -> [ThemesModel] {
        themes
    }
    
    init() {
        populateThemes()
    }
    private func populateThemes() {
        themes.append(ThemesModel(themeTitle: "Diversity", themeImageName: "flame"))
        themes.append(ThemesModel(themeTitle: "Inclusion", themeImageName: "bolt"))
        themes.append(ThemesModel(themeTitle: "Wild Life", themeImageName: "hare"))
        themes.append(ThemesModel(themeTitle: "Insects", themeImageName: "ant"))
        themes.append(ThemesModel(themeTitle: "Transport", themeImageName: "car"))
        themes.append(ThemesModel(themeTitle: "Peripherals", themeImageName: "tv.music.note"))
        themes.append(ThemesModel(themeTitle: "Writer", themeImageName: "pencil"))
        themes.append(ThemesModel(themeTitle: "Kingdom", themeImageName: "sun.max"))
    }
}

