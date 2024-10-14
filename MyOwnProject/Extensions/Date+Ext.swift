//
//  Date+Ext.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 13/10/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
