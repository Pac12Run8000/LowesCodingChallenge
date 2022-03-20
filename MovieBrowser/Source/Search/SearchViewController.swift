//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit
import Foundation

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
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        self.title = "Movie Search"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let text = searchBar.text, !text.isEmpty else {return}
        Network<Movies>.NetworkManager(search: text) { [weak self] result in
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let destViewController = segue.destination as! MovieDetailViewController
            destViewController.movie = self.movie
        }
    }
    
    
    
}

extension SearchViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = arrayOfMovies![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomSearchCell
        cell?.titleLabel.text = movie.title
        cell?.dateLabel.text = movie.release_date.stringToDate(format: .yearMonthDay)?.dateToString(format: .monthDayYear)
        cell?.voteAverageLabel.text = "\(movie.vote_average)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let movie = arrayOfMovies![indexPath.row] as? Movie else {return}
        self.movie = movie
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
}
