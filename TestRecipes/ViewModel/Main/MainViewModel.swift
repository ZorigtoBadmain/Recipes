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
    var recipe: [Recipe] = []
    var detailviewmodel: DetailViewModel!
    
    var count: Int {
        return recipe.count
    }
    
    var name: String?
    var image: UIImage?
    
    public func loadRecipes(complition: @escaping () -> ()) {
        loadRecipe.load { (recipe) in
            self.recipe = recipe.recipes
            complition()
        }
    }
    
    func nameLoad(index: Int) -> String {
        return recipe[index].name
    }
    
    func urlStringImage(index: Int) -> String {
        return recipe[index].images.first ?? ""
    }
    
    func detailViewModel(index: Int) -> DetailViewModel {
        self.detailviewmodel = DetailViewModel(recipe: (recipe[index]))
        return self.detailviewmodel
    }
}

