//
//  CellViewModel.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 16.03.2021.
//

import Foundation

class CellViewModel {
    var recipeName: String!
    var imageRecipe: String!
    
    required init(recipe: Recipe) {
        self.recipeName = recipe.name
        self.imageRecipe = recipe.images.first
    }
}
