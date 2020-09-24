//
//  CategoryModel.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDB<T: Object>: RealmOperationProtocol {
    
    var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Realm Initialization Error: \(error)")
        }
    }
    
    func delete(_ object: T) {
        guard let realm = realm else {return}
        do {
            let objects = realm.objects(T.self)
            if objects.contains(object) {
                try realm.write {
                    realm.delete(object)
                }
            }
        }
        catch let error as NSError {
            print("delete \(error)")
        }
        
    }
    
    func deleteAll() {
        guard let res = findAllResults() else { return }
        guard let realm = realm else {return}
        do {
            try realm.write {
                realm.delete(res)
            }
        } catch {
            fatalError("Realm Error Deleting Objects: \(error)")
        }
    }
    
    func deleteAll(_ objects: [T]) {
        guard let realm = realm else {return}
        do {
            for object in objects {
                try realm.write {
                    realm.delete(object)
                }
            }
        }
        catch let error as NSError {
            print("deleteAll \(error)")
        }
    }
    func update(_ object: T) {
        guard let realm = realm else {return}
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        }
        catch let error as NSError {
            print("deleteAll \(error)")
        }
        
    }
    
    func updateAll(_ objects: [T]) {
        objects.forEach({update($0)})
    }
    
    func save(_ object: T) {
        guard let realm = realm else {return}
        do {
            try realm.write {
                print("Save successuflly")
                realm.add(object, update: .modified)
            }
        }
        catch let error as NSError {
            print("deleteAll \(error)")
        }
    }
    
    func saveAll(_ objects: [T]) {
        objects.forEach({save($0)})
    }
    
    func findByPrimaryKey(_ identifier: Any) -> T? {
        guard let realm = realm else {return nil}
        return realm.object(ofType: T.self, forPrimaryKey: identifier)
    }
    
    func findAll() -> [T]? {
        guard let res = findAllResults() else { return [] }
        return Array(res)
    }
    
    private func findAllResults() -> Results<T>? {
        guard let realm = realm else {return nil}
        return realm.objects(T.self)
    }
    
    
}
