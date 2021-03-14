//
//  Network.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 12.03.2021.
//

import Foundation

class LoadRecipe {
    static let shared = LoadRecipe()
    
    func load(complition: @escaping(RecipesArray) -> ()) {
        let stringUrl = "https://test.kode-t.ru/recipes.json"
        guard let url = URL(string: stringUrl) else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(RecipesArray.self, from:data)
                    print(result)
                    DispatchQueue.main.async {
                        complition(result)
                    }
                    
                  } catch {
                    print("JSON Error: \(error)")
                 }
            }
            
        }
        task.resume()
    }
}
