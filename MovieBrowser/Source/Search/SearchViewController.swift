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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        self.title = "Movie Search"
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        print("Test Blah")
    }
    
}
