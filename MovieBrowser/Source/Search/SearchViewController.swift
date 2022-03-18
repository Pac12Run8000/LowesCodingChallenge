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
    @IBOutlet weak var tableView: UITableView!
    
    
    var results:Movies? {
        didSet {
            self.arrayOfMovies = results?.results
        }
    }
    var arrayOfMovies:[Movie]? {
        didSet {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        self.title = "Movie Search"
        tableView.delegate = self
        tableView.dataSource = self
        
//        var dateString = "2018-05-15"
//        let dateObject = dateString.stringToDate(format: .yearMonthDay)
//        print("The date:\(dateObject)")
//        print("Formatted to string:\(dateObject?.dateToString(format: .monthDayYear))")

    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let text = searchBar.text, !text.isEmpty else {return}
        Network.NetworkManager(search: text) { [weak self] result in
            switch result {
            case .failure(let err):
                guard let strongself = self else {return}
                DispatchQueue.main.async {
                    Alert.presentAlertError(text: err.description, control: strongself)
                }
            case .success(let results):
                guard let strongself = self else {return}
                strongself.results = results
            }
        }
    }
    
}

extension SearchViewController:UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfMovies![indexPath.row].original_title
        return cell
    }
    
    
    
    
}
