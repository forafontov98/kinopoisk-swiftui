//
//  Request.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

import Foundation

protocol Request {

    var method: HttpMethod { get }
    var queryItems: [String: String]? { get }
}

extension Request {

    func urlRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "http"
        components.path = "\(ApiConstants.url)/"
        components.queryItems = (queryItems ?? [:]).map {
            .init(name: $0.key, value: $0.value)
        }
        components.queryItems?.append(.init(name: "apikey", value: ApiConstants.apiKey))

        guard let url = components.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
