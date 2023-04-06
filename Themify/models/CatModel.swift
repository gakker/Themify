//
//  CatModel.swift
//  Themify
//
//  Created by Brilliant Gamez on 3/10/22.
//

import Foundation

struct CatModel: Hashable, Codable, Identifiable{
    var id: Int
    var catName: String
    var themes: [ThemeModel]
}
