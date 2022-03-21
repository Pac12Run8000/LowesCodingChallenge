//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateOutlet: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    var movie:Movie? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongself = self else {return}
                strongself.titleLabel.text = strongself.movie?.title
                guard let date = strongself.movie?.releaseDate, let formattedDate = date.stringToDate(format: .yearMonthDay)?.dateToString(format: .monthDayYear2) else {return}
                strongself.releaseDateOutlet.text = "Release Date: \(formattedDate)"
                strongself.overviewLabel.text = strongself.movie?.overview
                guard let posterPath = strongself.movie?.posterPath, let urlString = CustomURL.posterPath + "\(posterPath)" as? String, let url = URL(string: urlString) else {return}
                
                if let myView = strongself.moviePosterImage as? CustomImageView {
                    myView.loadImage(from: url) { image in
                        strongself.moviePosterImage.image = image
                    }
                }
               
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
    }
    
    
}
