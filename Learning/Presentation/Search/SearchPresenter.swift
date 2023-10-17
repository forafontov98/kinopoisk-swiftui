//
//  SearchPresenter.swift
//  Learning
//
//  Created by MacBook on 14.09.2023.
//

protocol SearchPresenterProtocol {

    @MainActor
    func present(response: SearchResponse)

    @MainActor
    func presentLoading()

    @MainActor
    func presentError(_ error: NetworkError)
}

final class SearchPresenter: SearchPresenterProtocol {

    weak var model: SearchModelInput?

    @MainActor
    func present(response: SearchResponse) {
        model?.display((response.search ?? []).map {
            ShortMovieViewModel(movieId: $0.id, title: $0.title, year: $0.year, poster: $0.poster)
        })
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
