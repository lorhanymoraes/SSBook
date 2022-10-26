//
//  AuthorDataResponse.swift
//  SSBook
//
//  Created by Lorhany Moraes on 25/10/22.
//

import Foundation

struct AuthorDataResponse: Codable {
    let data: FavoriteDataAuthor?
}

struct FavoriteDataAuthor: Codable {
    let favoriteAuthors: [FavoriteAuthor]?
}

struct FavoriteAuthor: Codable {
    let id, name: String?
    let picture: String?
    let booksCount: Int?
}
