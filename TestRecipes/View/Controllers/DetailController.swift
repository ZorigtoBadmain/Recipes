//
//  DetailController.swift
//  TestRecipes
//
//  Created by Зоригто Бадмаин on 13.03.2021.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var nameString: String?
    var instructionString: String?
    var descriptionString: String?
    var imageArray: [String] = []
    var detailViewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionConfig()
        
        name.text = detailViewModel.name
        descriptionLabel.text = detailViewModel.description
        instructionLabel.text = detailViewModel.instruction

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backAction))
    }
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionConfig() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension DetailController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControll.numberOfPages = detailViewModel.imageArray.count
        return detailViewModel.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCell
        let page = Int(collectionView.contentOffset.x/view.bounds.width)
        pageControll.currentPage = Int(page)
        
        let detailImag = detailViewModel.imageArray[indexPath.row]
        
        cell.detailImage.load(urlString: detailImag)
        
        return cell
    }
    
}
