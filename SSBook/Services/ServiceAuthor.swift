//
//  ServiceAuthor.swift
//  SSBook
//
//  Created by Lorhany Moraes on 25/10/22.
//

import Foundation

import Foundation

class NetworkServicesAuthor {

    static let shared = NetworkServicesAuthor()

    func getFavoritesAuthors(onSuccess: (AuthorData) -> Void, OnError: () -> Void) {
       
        if let path = Bundle.main.path(forResource: "AuthorJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let favoriteMovies = try decoder.decode(AuthorData.self, from: data)
                onSuccess(favoriteMovies)
            } catch {
                OnError()
            }
        }
    }
}
