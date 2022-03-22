//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/20/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class SearchViewModel {
    
    var arrayOfMovie:[Movie] = [Movie]()
    
    init(array:[Movie]) {
        self.arrayOfMovie = array
    }
    
    public func fetchTableViewCell(tableView:UITableView, indexPath:IndexPath, controller:UIViewController) -> UITableViewCell {
        let movie = self.arrayOfMovie[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomSearchCell
        cell?.titleLabel.text = movie.title
        cell?.dateLabel.text = movie.releaseDate.stringToDate(format: .yearMonthDay)?.dateToString(format: .monthDayYear)
        if let voteAverage = movie.voteAverage {
            cell?.voteAverageLabel.text = "\(voteAverage)"
        }
        return cell ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
}
