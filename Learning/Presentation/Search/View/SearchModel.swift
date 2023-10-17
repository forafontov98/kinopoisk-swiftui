//
//  SearchModel.swift
//  Learning
//
//  Created by MacBook on 18.04.2023.
//

import Combine

/// Протокол для Presenter
protocol SearchModelInput: AnyObject {

    @MainActor
    func display(_ items: [ShortMovieViewModel])

    @MainActor
    func displayLoading()

    @MainActor
    func displayError(_ error: NetworkError)
}

final class SearchModel: ObservableObject {

    @Published private(set) var state: SceneState<[ShortMovieViewModel]> = .loading
    @Published var searchText = ""

    private var subscriptions: [AnyCancellable] = []
    private let interactor: SearchInteractorProtocol

    init(interactor: SearchInteractorProtocol) {
        self.interactor = interactor
    }

    func onAppear() {
        interactor.start()
        bind()
    }

    private func bind() {
        $searchText.sink { [weak self] in
            self?.interactor.search(query: $0)
        }.store(in: &subscriptions)
    }
}

extension SearchModel: SearchModelInput {

    @MainActor
    func display(_ items: [ShortMovieViewModel]) {
        self.state = .success(data: items)
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
