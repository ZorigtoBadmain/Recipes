//
//  MainViewModel.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 12.03.2021.
//

import Foundation
import UIKit

class MainViewModel {
    
    var loadRecipe = LoadRecipe()
    var recipe: RecipesArray?
    
    var count: Int {
        return recipe?.recipes.count ?? 0
    }
    
    var name: String?
    var image: UIImage?
    
    public func loadRecipes(complition: @escaping () -> ()) {
        loadRecipe.load { (recipe) in
            self.recipe = recipe
            complition()
        }
    }
    
    func nameLoad(index: Int) -> String {
        return recipe?.recipes[index].name ?? ""
    }
    
    func urlStringImage(index: Int) -> String {
        return recipe?.recipes[index].images.first ?? ""
    }
}

