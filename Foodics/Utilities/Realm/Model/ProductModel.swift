//
//  ProductModel.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class ProductModel: Object, Codable {
  
    // MARK: - dynamic Properties
    dynamic var category: CategoryModel?
    dynamic var id: String?
    dynamic var name: String?
    dynamic var image: String?
    dynamic var price, cost: Double?
    
    // MARK: - primaryKey for sorting attribute keys
    override static func primaryKey() -> String? {
        return "id"
    }

   
    // MARK: - Codable
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id,name,image,price,cost,category
    }

    convenience init(id: String?, name: String?, image: String?,
                     price: Double?, cost: Double?, category: CategoryModel?) {
         self.init()
         self.id = id
         self.name = name
         self.image = image
         self.price = price
         self.cost = cost
         self.category = category
     }
     
    convenience required init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String?.self, forKey: .id)
        let name = try container.decode(String?.self, forKey: .name)
        let image = try container.decode(String?.self, forKey: .image)
        let price = try container.decode(Double?.self, forKey: .price)
        let cost = try container.decode(Double?.self, forKey: .cost)
        let category = try container.decode(CategoryModel?.self, forKey: .category)
        
        self.init(id: id, name: name, image: image,
                  price: price,cost: cost,category: category )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(image, forKey: .image)
            try container.encode(price, forKey: .price)
            try container.encode(cost, forKey: .cost)
            try container.encode(category, forKey: .category)
        }catch(let error){
            print("encoder error",error.localizedDescription)
        }
    }
    
    required init() {
        super.init()
    }
    
    
    required init(value: Any, schema: RLMSchema) {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init()
    }
    

}

protocol ProductRepoProtocol {
    func getAll() -> [ProductModel]?
    func deleteAll()
    func save(_ object: ProductModel)
}


class ProductRepo: ProductRepoProtocol {
    lazy var productDBO = RealmDB<ProductModel>()
     
    func save(_ object: ProductModel) {
        guard let id = object.id else{return}
        if let savedBefore = productDBO.findByPrimaryKey(id){
            print("categorySavedBefore",savedBefore.id ?? "" )
        }else{
            productDBO.save(object)
        }
     }
    func getAll() -> [ProductModel]? {
        return productDBO.findAll()
    }

    func deleteAll() {
        productDBO.deleteAll()
    }

}
