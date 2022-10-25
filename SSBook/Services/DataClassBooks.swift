//
//  FavoritesBooksResponse.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation

struct FavoriteData: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let favoriteBooks: [FavoriteBook]?
}

// MARK: - FavoriteBook
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

// MARK: - Author
struct Author: Codable {
    let id: String?
    let name: String?
}


