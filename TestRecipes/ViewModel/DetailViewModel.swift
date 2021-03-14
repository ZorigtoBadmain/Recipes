//
//  DetailViewModel.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 13.03.2021.
//

import Foundation

class DetailViewModel {
    var recipe: Recipe?
    
    var name: String!
    var description: String? {
        recipe.debugDescription
    }
    var instruction: String? {
        recipe?.instructions
    }
    var imageArray: [String]? {
        recipe?.images
    }
}
