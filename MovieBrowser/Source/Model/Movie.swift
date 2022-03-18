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
    var original_title:String
    var release_date:String
    var vote_average:Double
}
