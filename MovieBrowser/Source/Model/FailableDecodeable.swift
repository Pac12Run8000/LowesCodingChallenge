//
//  FailableDecodeable.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/20/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct FailableDecodeable<T:Decodable>: Decodable {
    let element:T?
    init(from decoder: Decoder) throws {
        self.element = try? T(from: decoder)
    }
}
