//
//  SearchInteractor.swift
//  Learning
//
//  Created by MacBook on 18.04.2023.
//

protocol SearchInteractorProtocol {

    func start()
    func search(query: String)
}

final class SearchInteractor: SearchInteractorProtocol {

    private let presenter: SearchPresenterProtocol
    private let networkService: NetworkServiceProtocol

    private var query = String()

    init(presenter: SearchPresenterProtocol, networkService: NetworkServiceProtocol) {
        self.presenter = presenter
        self.networkService = networkService
    }

    func start() {
        fetch()
    }

    func search(query: String) {
        self.query = query
        fetch()
    }

    private func fetch() {
        Task {
            await presenter.presentLoading()

            let response: Result<SearchResponse, NetworkError> = await networkService.fetch(request: SearchRequest(query: query))

            switch response {
            case let .success(response):
                await presenter.present(response: response)
            case let .failure(error):
                await presenter.presentError(error)
            }
        }
    }
}
