//
//  ShortMovieViewModel.swift
//  Learning
//
//  Created by MacBook on 14.09.2023.
//

import Foundation

struct ShortMovieViewModel: Identifiable, Hashable {

    let id = UUID()
    let movieId: String
    let title: String?
    let year: String?
    let poster: String?
}
