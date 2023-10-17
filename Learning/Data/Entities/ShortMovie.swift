//
//  ShortMovie.swift
//  Learning
//
//  Created by MacBook on 12.09.2023.
//

struct ShortMovie: Decodable {

    let title: String?
    let year: String?
    let id: String
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case id = "imdbID"
        case poster = "Poster"
    }
}
