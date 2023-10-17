//
//  SceneState.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

enum SceneState<T> {

    case success(data: T)
    case failure(error: NetworkError)
    case loading
}
