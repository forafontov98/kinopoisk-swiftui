//
//  MovieAssembly.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

import SwiftUI

struct MovieAssembly {

    @MainActor
    func build(id: String) -> some View {
        let presenter = MoviePresenter()
        let interactor = MovieInteractor(presenter: presenter, id: id, networkService: NetworkService())
        let model = MovieModel(interactor: interactor)
        presenter.model = model

        let view = MovieView(output: model)
        return view
    }
}
