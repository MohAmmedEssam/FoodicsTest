//
//  ProductsVM.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/23/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
class ProductsVM{
    
    //temp var for pagination
    private var responseModel: ResponseModel<ProductModel>?
    
    private let repo: ProductRepoProtocol

    init(_ repo: ProductRepoProtocol = ProductRepo()) {
        self.repo = repo
    }
    
    func getProducts(completion: @escaping (_ products: [ProductModel])->()){
        ApiClient().request(method: .get,
                            type: .json,
                            endpoint: .products,
                            authenticated: true) { [weak self] (response:ResponseModel<ProductModel>?, error, statusCode) in
                                
            guard error == nil else{
                completion(self?.repo.getAll() ?? [])
                return
            }
            guard statusCode == 200 else{return}
                                
            guard let res = response?.data else{return}

            self?.responseModel = response

            res.forEach({self?.repo.save($0)})

            completion(res)
        }
    }
    
}
