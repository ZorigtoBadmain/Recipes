//
//  ViewController.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 12.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var mainViewModel = MainViewModel()
    var detailViewModel = DetailViewModel()
    var router: Router?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.router = Router(self)
        mainViewModel.loadRecipes {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        let nibCell = UINib(nibName: "RecipeCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeCell
        
        cell.nameRecipe.text = mainViewModel.nameLoad(index: indexPath.row)
        cell.imageRecipe.load(urlString: mainViewModel.urlStringImage(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let recipe = mainViewModel.recipe?.recipes[indexPath.row] {
            router?.detail(recipe: recipe)
            
        }
//        detailViewModel.name = mainViewModel.recipe?.recipes[indexPath.row].name
        

        
        
    }
}

