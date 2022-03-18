//
//  AlertUtility.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/18/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit


struct Alert {
    
    static func presentAlertError(text:String, control:UIViewController) {
        let alert = UIAlertController(title: "Try again later.", message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        control.present(alert, animated: true)
    }
    
}
