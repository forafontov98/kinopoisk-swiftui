//
//  SearchResponse.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

struct SearchResponse: Decodable {

    let search: [ShortMovie]?
    let total: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case total = "totalResults"
    }
}
