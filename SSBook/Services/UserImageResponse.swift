//
//  UserImageResponse.swift
//  SSBook
//
//  Created by Lorhany Moraes on 26/10/22.
//

import Foundation

struct UserImageResponse: Codable {
    let dataImage: ImageData?
}

struct ImageData: Codable {
    let userPicture: String?
}
