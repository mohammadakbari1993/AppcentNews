//
//  StringDate+Convert.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation

extension String {
    
    func dateConvert(from inputDateFormat : DateFormatsEnum = .ISO, to outputDateFormat: DateFormatsEnum) -> String? {
        guard let date = processDate(inputDateFormat: inputDateFormat) else {
            print("Invalid date format in \(#file)")
            return nil
        }
        return date.convertToString(outputDateFormat: outputDateFormat)
    }
    
    private func processDate(inputDateFormat : DateFormatsEnum) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputDateFormat.rawValue
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            print("Invalid date format in \(#file)")
            return nil
        }
    }
    
}
