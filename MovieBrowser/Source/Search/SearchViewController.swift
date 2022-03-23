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
    
    var viewModel:SearchViewModel?
    
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
            guard let arrayOfMovies = arrayOfMovies else {return}
            viewModel = SearchViewModel(array: arrayOfMovies)
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
                strongself.results = results.element
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomSearchCell
        cell?.titleLabel.text = viewModel?.fetchTitleLabel(indexPath: indexPath)
        cell?.dateLabel.text = viewModel?.fetchDateLabel(indexPath: indexPath)
        cell?.voteAverageLabel.text = viewModel?.fetchVoteAverage(indexPath: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let arrayOfMovies = arrayOfMovies, let movie = arrayOfMovies[indexPath.row] as? Movie else {return}
        self.movie = movie
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
}



