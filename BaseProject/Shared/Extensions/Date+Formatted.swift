//
//  Date+Formatted.swift
//  BaseProject
//
//  Created by Tony  Wang on 4/19/21.
//

import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
