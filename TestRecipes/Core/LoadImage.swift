//
//  LoadImage.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 13.03.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
