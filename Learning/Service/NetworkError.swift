//
//  NetworkError.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

enum NetworkError: Error {

    case unknown
    case parsing
}

extension NetworkError {

    var title: String {
        switch self {
        case .unknown:
            return "Неизвестная ошибка"
        case .parsing:
            return "Ответ не соответствует контракту"
        }
    }
}
