//
//  String+Ext.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 19.01.2024.
//

import Foundation

extension String {
    func contertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.contertToDate() else {return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
