//
//  MovieTicket.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class MovieTicket {
    private let movieScreening: MovieScreening
    private let rowNr: Int
    private let seatNr: Int
    private let isPremium: Bool
    
    init(movieScreening: MovieScreening, rowNr: Int, seatNr: Int, isPremium: Bool) {
        self.movieScreening = movieScreening
        self.rowNr = rowNr
        self.seatNr = seatNr
        self.isPremium = isPremium
    }
    
    func isPremiumTicket() -> Bool {
        isPremium
    }
    
    func getPrice() -> Double {
        movieScreening.getPricePerSeat()
    }
    
    func getDateAndTime() -> Date {
        movieScreening.getDateAndTime()
    }
    
    func toString() -> String {
        return ""
    }
}
