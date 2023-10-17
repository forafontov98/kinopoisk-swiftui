//
//  MovieInteractor.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

protocol MovieInteractorProtocol {

    func start()
}

final class MovieInteractor: MovieInteractorProtocol {

    private let presenter: MoviePresenterProtocol
    private let id: String
    private let networkService: NetworkServiceProtocol

    init(presenter: MoviePresenterProtocol, id: String, networkService: NetworkServiceProtocol) {
        self.presenter = presenter
        self.id = id
        self.networkService = networkService
    }

    func start() {
        fetch()
    }

    private func fetch() {
        Task { [weak self] in
            guard let self else { return }
            await self.presenter.presentLoading()

            let response: Result<FullMovieResponse, NetworkError> = await self.networkService.fetch(request: MovieRequest(id: id))

            switch response {
            case let .success(response):
                await self.presenter.present(response: response)
            case let .failure(error):
                await self.presenter.presentError(error)
            }
        }
    }
}
