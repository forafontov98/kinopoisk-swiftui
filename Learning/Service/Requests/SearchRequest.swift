//
//  SearchRequest.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

struct SearchRequest: Request {

    let query: String

    var method: HttpMethod {
        .get
    }

    var queryItems: [String : String]? {
        ["s": query]
    }
}
