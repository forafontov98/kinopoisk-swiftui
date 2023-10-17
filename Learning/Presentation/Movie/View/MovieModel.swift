//
//  MovieModel.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

import Combine

/// Протокол для Presenter
protocol MovieModelInput: AnyObject {

    @MainActor
    func display(_ model: FullMovieViewModel)

    @MainActor
    func displayLoading()

    @MainActor
    func displayError(_ error: NetworkError)
}

final class MovieModel: ObservableObject {

    @Published private(set) var state: SceneState<FullMovieViewModel> = .loading

    private let interactor: MovieInteractorProtocol

    init(interactor: MovieInteractorProtocol) {
        self.interactor = interactor
    }

    func onAppear() {
        interactor.start()
    }
}

extension MovieModel: MovieModelInput {

    @MainActor
    func display(_ model: FullMovieViewModel) {
        self.state = .success(data: model)
    }

    @MainActor
    func displayLoading() {
        self.state = .loading
    }

    @MainActor
    func displayError(_ error: NetworkError) {
        self.state = .failure(error: error)
    }
}
