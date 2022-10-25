//
//  Service.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation

class NetworkServices {

    static let shared = NetworkServices()

    func getFavoritesBooks(onSuccess: (FavoriteData) -> Void, OnError: () -> Void) {
       
        if let path = Bundle.main.path(forResource: "FavoritesBooksJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let favoriteMovies = try decoder.decode(FavoriteData.self, from: data)
                onSuccess(favoriteMovies)
            } catch {
                OnError()
            }
        }
    }
}

