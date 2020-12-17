//
//  DateExtensions.swift
//  GHFollowers
//
//  Created by Paulo Inocencio on 12/12/20.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
