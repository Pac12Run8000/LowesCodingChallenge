//
//  CustomUrl.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/17/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation


class CustomURL {
    
    public static var posterPath = "https://image.tmdb.org/t/p/w500"
    
    static func fetchURL(searchText:String) -> URL? {
        guard let mUrl:String =  "https://api.themoviedb.org/3/search/movie?api_key=\(APISecurity.apiKey)&language=en-US&query=\(searchText)&page=1&include_adult=false".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) as? String else {
            return nil
        }
        guard let url = URL(string: mUrl) as? URL? else {
            return nil
        }
        return url
    }
    
    
}
