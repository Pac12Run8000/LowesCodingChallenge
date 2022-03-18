//
//  CustomErrors.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/17/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation


enum APIErrors:Error {
    case datataskError(err:Error)
    case httpResponseStatusCodeError(statusCode:Int)
    case noData
    case malformedURL
    case jsonError(err:String)
}

extension APIErrors:CustomStringConvertible {
    var description: String {
        switch self {
        case .datataskError(err: let err):
            return "The app could not complete the request: \(err.localizedDescription)"
        case .httpResponseStatusCodeError(statusCode: let num):
            return "The app sent a request, but it didn't work. Try again later: \(num)"
        case .noData:
            return "There is no data return base on your search criteria."
        case .malformedURL:
            return "Invalid request"
        case .jsonError(err: let err):
            return "Couldn't use the data: \(err.description)"
        }
    }
    
    
}
