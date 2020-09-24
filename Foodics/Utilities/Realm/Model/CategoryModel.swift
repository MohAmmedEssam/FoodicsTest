//
//  CategoryModel.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol CategoryRepoProtocol {
    func getAll() -> [CategoryModel]?
    func deleteAll()
    func save(_ object: CategoryModel)
}

@objcMembers
class CategoryModel: Object, Codable{
    // MARK: - dynamic Properties
    dynamic var id, name, image: String?
    
    // MARK: - primaryKey for sorting attribute keys
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: - Codable
    // MARK:  CodingKeys
    enum CodingKeys: String, CodingKey {
        case id, name, image
    }
    
    convenience init(id: String?, name: String?, image: String?) {
        self.init()
        self.id = id
        self.name = name
        self.image = image
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String?.self, forKey: .id)
        let name = try container.decode(String?.self, forKey: .name)
        let image = try container.decode(String?.self, forKey: .image)

        self.init(id: id, name: name, image: image)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(image, forKey: .image)
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

class CategoryRepo: CategoryRepoProtocol {
    lazy var categoryDBO = RealmDB<CategoryModel>()
     
    func save(_ object: CategoryModel) {
        guard let id = object.id else{return}
        if let savedBefore = categoryDBO.findByPrimaryKey(id){
            print("categorySavedBefore",savedBefore.id ?? "" )
        }else{
            categoryDBO.save(object)
        }
     }
    func getAll() -> [CategoryModel]? {
        return categoryDBO.findAll()
    }

    func deleteAll() {
        categoryDBO.deleteAll()
    }

}
