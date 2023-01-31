//
//  MovieScreening.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class MovieScreening {
    private let dateAndTime: Date
    private let pricePerSeat: Double
    
    init(dateAndTime: Date, pricePerSeat: Double) {
        self.dateAndTime = dateAndTime
        self.pricePerSeat = pricePerSeat
    }
    
    func getPricePerSeat() -> Double {
        pricePerSeat
    }
    
    func getDateAndTime() -> Date {
        return dateAndTime
    }
    
    func toString() -> String {
        return ""
    }
}
