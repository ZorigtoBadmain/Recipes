//
//  Recipe.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 12.03.2021.
//

import Foundation

// MARK: - RecipesArray
struct RecipesArray: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable {
    let uuid, name: String
    let images: [String]
    let lastUpdated: Int
    let recipeDescription: String?
    let instructions: String
    let difficulty: Int

    enum CodingKeys: String, CodingKey {
        case uuid, name, images, lastUpdated
        case recipeDescription = "description"
        case instructions, difficulty
    }
}
