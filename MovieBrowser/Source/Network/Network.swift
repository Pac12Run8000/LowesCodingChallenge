//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network<T:Codable> {
    
    public static func NetworkManager(search:String, completion:@escaping(Result<T, APIErrors>) -> ()) {
        guard let url = CustomURL.fetchURL(searchText: search) else {
            print("There is no URL.")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.datataskError(err: error!)))
                return
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.httpResponseStatusCodeError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            guard let jsonResponse = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.jsonError(err: "JSon error when decoding")))
                return
            }
            completion(.success(jsonResponse))
        }
        task.resume()
    }
    

    
   
    
    
    
    
}


