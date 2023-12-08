//
//  Extension+Date.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 07/12/23.
//

import Foundation

extension Date {
    
    func f(_ format: String = "d MMMM yyyy") -> String {
        let stringFormatter = DateFormatter()
        stringFormatter.locale = Locale(identifier: "id_ID")
        stringFormatter.timeZone = TimeZone(abbreviation: "UTC +7")
        stringFormatter.dateFormat = format
        return stringFormatter.string(from: self)
    }
    
}
