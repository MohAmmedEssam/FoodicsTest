//
//  CategoriesVM.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
class CategoriesVM{
    //temp var for pagination
    private var responseModel: ResponseModel<CategoryModel>?
    
    private  let repo: CategoryRepoProtocol

    init(_ repo: CategoryRepoProtocol = CategoryRepo()) {
        self.repo = repo
    }
    
    func getCategories(completion: @escaping (_ categories:[CategoryModel])->()){
        
        ApiClient().request(method: .get,
                            type: .json,
                            endpoint: .categories,
                            authenticated: true) { [weak self] (response:ResponseModel<CategoryModel>?, error, statusCode) in
                                
            guard error == nil else{
                completion(self?.repo.getAll() ?? [])
                return
            }
                                                
            guard statusCode == 200 else{return}
            
            guard let categories = response?.data else{return}
                                            
            self?.responseModel = response
                                
            categories.forEach({self?.repo.save($0)})
                                
            completion(categories)
        }
    }
    
}
