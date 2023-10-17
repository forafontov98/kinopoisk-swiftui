//
//  FullMovieViewModel.swift
//  Learning
//
//  Created by MacBook on 04.10.2023.
//

import Foundation

struct FullMovieViewModel: Identifiable {

    struct Option: Identifiable {
        let id = UUID()
        let name: String
        let value: String
    }

    let id = UUID()
    let title: String?
    let preview: String?
    let actors: [String]?
    let rating: String?
    let description: String?
    let options: [Option]
}
