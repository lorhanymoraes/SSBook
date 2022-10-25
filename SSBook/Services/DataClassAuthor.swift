//
//  DataClassAuthor.swift
//  SSBook
//
//  Created by Lorhany Moraes on 25/10/22.
//

import Foundation

// MARK: - Welcome
struct AuthorData: Codable {
    let data: FavoriteDataAuthor?
}

// MARK: - DataClass
struct FavoriteDataAuthor: Codable {
    let favoriteAuthors: [FavoriteAuthor]?
}

// MARK: - FavoriteAuthor
struct FavoriteAuthor: Codable {
    let id, name: String?
    let picture: String?
    let booksCount: Int?
}
