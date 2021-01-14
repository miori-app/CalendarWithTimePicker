//
//  String.swift
//  CustomCalendarTime
//
//  Created by miori Lee on 2021/01/15.
//

import Foundation
extension String {

    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var date: Date? {
        return String.dateFormatter.date(from: self)
    }

    var length: Int {
        return self.count
    }
}
