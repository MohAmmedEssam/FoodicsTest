//
//  ProductsVC.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoryId: String?
    var delegate: PopUpProtocol?
    
    private let viewModel = ProductsVM()
    private var products = [ProductModel](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
       viewModel.getProducts { [weak self] (products) in
            self?.products = products.filter({$0.category?.id == self?.categoryId})
        }
    }

}

    //MARK:- UICollectionView
extension ProductsVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.isEmpty ? collectionView.setEmptyMessage():collectionView.removeEmptyMessage()
        return self.products.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell",
                                                        for: indexPath) as! CategoryCell
        let name = self.products[indexPath.row].name ?? ""
        let price = "\(self.products[indexPath.row].price ?? 0)"
        
        let attributTxt = NSMutableAttributedString(string: name + "\n" + "price: " + price)
        attributTxt.setMultiText(name)
        attributTxt.setMultiText(price,withColor: DesignSystem.appColor(.FeatureGray),
                                 font: DesignSystem.appFont(.medium))
        attributTxt.setMultiText("price: ",withColor: DesignSystem.appColor(.FeatureGray),
                                 font: DesignSystem.appFont(.medium))

        
        cell.label.attributedText = attributTxt
        cell.img.imageFromURL(self.products[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.show(self.products[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
}
