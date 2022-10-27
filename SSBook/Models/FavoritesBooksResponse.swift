//
//  FavoritesBooksResponse.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation

struct FavoritesBooksResponse: Codable {
    let data: DataClass?
}

struct DataClass: Codable {
    let favoriteBooks: [FavoriteBook]?
}

struct FavoriteBook: Codable {
    let id, name: String?
    let author: Author?
    let cover: String?
    let favoriteBookDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, author, cover
        case favoriteBookDescription = "description"
    }
}

struct Author: Codable {
    let id: String?
    let name: String?
}


