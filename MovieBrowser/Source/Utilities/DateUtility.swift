//
//  DateUtility.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/18/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension String {
    
    func stringToDate(format:DateFormat) -> Date? {
        let dateString = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: "chr_US")
        guard let dateObj = dateFormatter.date(from: dateString) else {
            return nil
        }
        return dateObj
    }
    
    
}

extension Date {
    
    func dateToString(format:DateFormat) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "en_VI")
        dateFormatter.dateFormat = format.rawValue
        guard let dateString = dateFormatter.string(from: self) as? String else {
            return nil
        }
        return dateString
    }
}

enum DateFormat:String {
    case yearMonthDay = "yyyy-MM-dd"
    case monthDayYear = "MMMM d, yyyy"
}
