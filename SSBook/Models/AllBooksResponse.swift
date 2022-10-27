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
    let allBooks: [Book]?
}

