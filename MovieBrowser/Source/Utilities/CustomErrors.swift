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
