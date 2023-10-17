//
//  MoviePresenter.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

import Foundation

protocol MoviePresenterProtocol {

    @MainActor
    func present(response: FullMovieResponse)

    @MainActor
    func presentLoading()

    @MainActor
    func presentError(_ error: NetworkError)
}

final class MoviePresenter: MoviePresenterProtocol {

    weak var model: MovieModelInput?

    @MainActor
    func present(response: FullMovieResponse) {
        model?.display(FullMovieViewModel(
            title: response.title,
            preview: response.poster,
            actors: response.actors?.components(separatedBy: ", "),
            rating: response.imdbRating,
            description: response.plot,
            options: [
                response.year.map({ .init(name: "Год выпуска", value: $0) }),
                response.runtime.map({ .init(name: "Длительность", value: $0) }),
                response.genre.map({ .init(name: "Жанр", value: $0) })
            ].compactMap({ $0 })
        ))
    }

    @MainActor
    func presentLoading() {
        model?.displayLoading()
    }

    @MainActor
    func presentError(_ error: NetworkError) {
        model?.displayError(error)
    }
}
