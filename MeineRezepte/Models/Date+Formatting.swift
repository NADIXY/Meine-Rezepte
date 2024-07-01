//
//  Date+Formatting.swift
//  ProjektwocheOne
//
//  Created by Leonid Riedel on 16.02.24.
//

import Foundation

extension Date {
    var string: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
}
