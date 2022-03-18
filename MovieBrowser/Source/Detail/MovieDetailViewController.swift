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
    
    var movie:Movie? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongself = self else {return}
                strongself.titleLabel.text = strongself.movie?.title
                guard let date = strongself.movie?.release_date, let formattedDate = date.stringToDate(format: .yearMonthDay)?.dateToString(format: .monthDayYear2) else {return}
                strongself.releaseDateOutlet.text = "Release Date: \(formattedDate)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
    }
    
    
}
