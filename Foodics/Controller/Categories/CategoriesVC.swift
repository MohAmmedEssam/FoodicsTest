//
//  ViewController.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categories = [CategoryModel](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private let viewModel = CategoriesVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initCollection()
        self.getData()
    }
    //MARK: add delegate and register cell
    func initCollection(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil),
                                     forCellWithReuseIdentifier: "CategoryCell")
    }
    
    //MARK: get data from API
    func getData(){
        self.viewModel.getCategories { [weak self] (categories) in
            self?.categories = categories
        }
    }
}

//MARK:- UICollectionView
extension CategoriesVC: UICollectionViewDelegate,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.categories.isEmpty ? collectionView.setEmptyMessage():collectionView.removeEmptyMessage()
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell",
                                                      for: indexPath) as! CategoryCell
        let name = self.categories[indexPath.row].name ?? ""
        let attributTxt = NSMutableAttributedString(string: name)
        attributTxt.setMultiText(name)
        
        cell.label.attributedText = attributTxt
        cell.img.imageFromURL(self.categories[indexPath.row].image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ProductsVC") as! ProductsVC
        vc.categoryId = self.categories[indexPath.row].id
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK:- showPopUP
extension CategoriesVC: PopUpProtocol{
    func show(_ product: ProductModel) {
        let vc = PopUpVC()
        self.add(vc)

        let name = product.name ?? ""
        let price = "\(product.price ?? 0)"
        
        let attributTxt = NSMutableAttributedString(string: name + "\n" + "price: " + price)
        attributTxt.setMultiText(name)
        attributTxt.setMultiText(price,withColor: DesignSystem.appColor(.FeatureGray),
                                 font: DesignSystem.appFont(.medium))
        attributTxt.setMultiText("price: ",withColor: DesignSystem.appColor(.FeatureGray),
                                 font: DesignSystem.appFont(.medium))

        
        vc.label.attributedText = attributTxt

        vc.img.imageFromURL(product.image)
        

    }
}
protocol PopUpProtocol : class {
    func show(_ product: ProductModel)
}
