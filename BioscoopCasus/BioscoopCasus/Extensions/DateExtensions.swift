//
//  DateExtensions.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

extension Date {
    func isWeekend() -> Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: self)
        if let dayOfWeek = components.weekday {
            return dayOfWeek < 2 || dayOfWeek > 5
        } else {
            return false
        }
    }
}
