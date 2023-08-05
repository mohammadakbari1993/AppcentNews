//
//  Date+Convert.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation

extension Date {
    
    func convertToString(outputDateFormat : DateFormatsEnum) -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = outputDateFormat.rawValue
        // Convert Date to String
        return dateFormatter.string(from: self)
    }
    
}
