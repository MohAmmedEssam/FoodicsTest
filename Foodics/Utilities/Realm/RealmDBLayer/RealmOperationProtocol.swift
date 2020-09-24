//
//  CategoryModel.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//
import Foundation
import RealmSwift

protocol RealmOperationProtocol {
    associatedtype T: Object

    func delete(_ object: T)
    func deleteAll(_ objects: [T])
    func deleteAll()
    func update(_ object: T)
    func updateAll(_ objects: [T])
    func save(_ object: T)
    func saveAll(_ objects: [T])
    func findByPrimaryKey(_ identifier: Any) -> T?
    func findAll() -> [T]?
}
