//
//  graphyQLModel.swift
//  SSBook
//
//  Created by Lorhany Moraes on 24/10/22.
//

import Foundation

//
//func querySpecificRepositoryWithGraphQLQuery() async throws -> BooksGraphQLResponse {
//
//    var request = URLRequest(url: URL(string: "")!)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let query =
//                ""
//
//    let payload = Payload(query: query)
//    let postData = try! JSONEncoder().encode(payload)
//    request.httpBody = postData
//
//    let response = try await URLSession.shared.data(for: request)
//
//    // GitHub returns dates according to the ISO 8601 standard so let's use the appropiate stragegy. Otherwise the decoding will fail and an error gets thrown
//    let jsonDecoder = JSONDecoder()
//    jsonDecoder.dateDecodingStrategy = .iso8601
//
//    let jsonData = response.0
//
//    // Decode to the generated types by quicktype.io
//    let graphQLResponse = try jsonDecoder.decode(BooksGraphQLResponse.self, from: jsonData)
//
//    return graphQLResponse
//}
