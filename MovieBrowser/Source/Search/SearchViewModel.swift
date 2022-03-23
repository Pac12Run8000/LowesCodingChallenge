//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/20/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    var arrayOfMovie:[Movie] = [Movie]()
    
    init(array:[Movie]) {
        self.arrayOfMovie = array
    }
    
    func fetchTitleLabel(indexPath:IndexPath) -> String {
        return arrayOfMovie[indexPath.row].title ?? "no title"
    }
    func fetchDateLabel(indexPath:IndexPath) -> String {
        return arrayOfMovie[indexPath.row].releaseDate.stringToDate(format: .yearMonthDay)?.dateToString(format: .monthDayYear) ?? "no date"
    }
    func fetchVoteAverage(indexPath:IndexPath) -> String {
        return "\(arrayOfMovie[indexPath.row].voteAverage ?? 0.0)"
    }
    
}
