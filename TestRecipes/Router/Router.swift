//
//  Router.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 13.03.2021.
//

import Foundation
import UIKit

enum ControllerID: String {
    case detailController = "DetailController"
}

enum StoryboardID: String {
    case main = "Main"
}

class Router {
    var controller: UIViewController?
    var storyboardID: StoryboardID? = .main
    var controllerID: ControllerID?
//    var detailViewModel = DetailViewModel()
    
    required init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    deinit {
        print("deinit")
    }
    
    func detail(index: Int) {
        storyboardID = .main
        controllerID = .detailController
        let storyboard = UIStoryboard(name: storyboardID!.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: controllerID!.rawValue) as! DetailController
    
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        self.controller?.present(navigation, animated: true, completion: nil)
    }
}
