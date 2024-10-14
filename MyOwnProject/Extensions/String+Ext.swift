//
//  String+Ext.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 13/10/24.
//

import Foundation

extension String {
    
    func convertDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_IN")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormate() -> String {
        guard let date = self.convertDate() else { return "N/A" }
        return date.convertToMonthYearFormate()
    }
}
