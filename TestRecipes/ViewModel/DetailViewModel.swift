//
//  DetailViewModel.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 13.03.2021.
//

import Foundation

class DetailViewModel {
    
    var name: String!
    var description: String!
    var instruction: String!
    var imageArray: [String]!
    
    required init(recipe: Recipe) {
        self.name = recipe.name
        self.description = recipe.recipeDescription
        self.instruction = recipe.instructions
        self.imageArray = recipe.images
    }
}
