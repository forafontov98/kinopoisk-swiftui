//
//  MovieRequest.swift
//  Learning
//
//  Created by MacBook on 04.10.2023.
//

struct MovieRequest: Request {

    let id: String

    var method: HttpMethod {
        .get
    }

    var queryItems: [String : String]? {
        ["i": id]
    }
}
