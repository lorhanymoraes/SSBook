//
//  NetworkServices.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation

class NetworkServices {

    static let shared = NetworkServices()

    func getFavoritesBooks(onSuccess: (FavoritesBooksResponse) -> Void, OnError: (ErrorResponse) -> Void) {
       
        if let path = Bundle.main.path(forResource: "FavoritesBooksJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let favoriteMovies = try decoder.decode(FavoritesBooksResponse.self, from: data)
                onSuccess(favoriteMovies)
            } catch {
                print(error.localizedDescription)
                OnError(.noResponse)
            }
        }
    }
    

    func getFavoritesAuthors(onSuccess: (AuthorDataResponse) -> Void, OnError: (ErrorResponse) -> Void) {
       
        if let path = Bundle.main.path(forResource: "AuthorJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let favoriteMovies = try decoder.decode(AuthorDataResponse.self, from: data)
                onSuccess(favoriteMovies)
            } catch {
                print(error.localizedDescription)
                OnError(.noResponse)
            }
        }
    }
    
    func getUserImage(onSuccess: (UserImageResponse) -> Void, OnError: (ErrorResponse) -> Void) {
       
        if let path = Bundle.main.path(forResource: "UserImageJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let favoriteMovies = try decoder.decode(UserImageResponse.self, from: data)
                onSuccess(favoriteMovies)
            } catch {
                print(error.localizedDescription)
                OnError(.noResponse)
            }
        }
    }
    
    
}

