//
//  SearchAssembly.swift
//  Learning
//
//  Created by MacBook on 14.09.2023.
//

import SwiftUI

struct SearchAssembly {

    @MainActor
    func build() -> some View {
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(presenter: presenter, networkService: NetworkService())
        let model = SearchModel(interactor: interactor)
        presenter.model = model

        let view = SearchView(output: model)
        return view
    }
}
