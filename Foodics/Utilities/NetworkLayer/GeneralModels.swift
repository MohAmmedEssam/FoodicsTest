//
//  GeneralModels.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct ResponseModel<T: Codable>: Codable {
    let data: [T]?
    let links: Links?
    let meta: Meta?
}

// MARK: - Links
struct Links: Codable {
    let first, last: String?
    let prev, next: String?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int?
    let path: String?
    let perPage, to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case to, total
    }
}
