//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    var results:Movies? {
        didSet {
           
            self.arrayOfMovies = results?.results
        }
    }
    var arrayOfMovies:[Movie]? {
        didSet {
            
            print("arrayOfMovies:\(arrayOfMovies)")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        self.title = "Movie Search"
        
        
//        var dateString = "2018-05-15"
//        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = "2018-05-15"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale.init(identifier: "chr_US")

        let dateObj = dateFormatter.date(from: dateString)
        print("actual date object:\(dateObj)")
//        dateFormatter.dateFormat = "MM-dd-yyyy"
//        print("Dateobj: \(dateFormatter.string(from: dateObj!))")
       
        

    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let text = searchBar.text, !text.isEmpty else {return}
        Network.NetworkManager(search: text) { [weak self] result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let results):
                guard let strongself = self else {return}
                strongself.results = results
            }
        }
    }
    
}
