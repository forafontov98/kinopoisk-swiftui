//
//  FullMovieResponse.swift
//  Learning
//
//  Created by MacBook on 04.10.2023.
//

struct FullMovieResponse: Decodable {

    let title: String?
    let year: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let actors: String?
    let plot: String?
    let id: String
    let imdbRating: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case actors = "Actors"
        case plot = "Plot"
        case id = "imdbID"
        case imdbRating
        case poster = "Poster"
    }
}
