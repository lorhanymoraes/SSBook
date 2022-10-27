//
//  AllBooksResponse.swift
//  SSBook
//
//  Created by Lorhany Moraes on 27/10/22.
//

import Foundation


struct AllBooksResponse: Codable {
    let data: AllDataResponse?
}

struct AllDataResponse: Codable {
    let allBooks: [AllBook]?
}

struct AllBook: Codable {
    let id, name: String?
    let author: AllAuthor?
    let cover: String?
    let allBookDescription: String?
    
    enum CodingKeys: String, CodingKey {
            case id, name, author, cover
            case allBookDescription = "description"
        }
}

struct AllAuthor: Codable {
    let id, name: String?
}
