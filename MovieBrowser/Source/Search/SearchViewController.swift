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
    
    var movies:Movies? {
        didSet {
            print("computed property:\(movies)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        self.title = "Movie Search"
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let text = searchBar.text, !text.isEmpty else {return}
        Network.NetworkManager(search: text) { [weak self] result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let results):
                guard let strongself = self else {return}
                strongself.movies = results
            }
        }
    }
    
}
