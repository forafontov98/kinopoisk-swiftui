//
//  NetworkService.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {

    func fetch<T: Decodable>(request: Request) async -> Result<T, NetworkError>
}

final class NetworkService: NetworkServiceProtocol {

    func fetch<T: Decodable>(request: Request) async -> Result<T, NetworkError> {
        guard let req = request.urlRequest() else {
            return .failure(.unknown)
        }

        let result = try? await URLSession.shared.data(for: req)

        if let data = result?.0, let model = try? JSONDecoder().decode(T.self, from: data) {
            return .success(model)
        } else {
            return .failure(.parsing)
        }
    }
}
