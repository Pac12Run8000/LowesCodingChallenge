//
//  Movie.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/17/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Movies:Codable {
    var results:[Movie]
}

struct Movie:Codable {
    var title:String
    var releaseDate:String
    var voteAverage:Double?
    var overview:String?
    var posterPath:String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview
        case posterPath = "poster_path"
    }
}
