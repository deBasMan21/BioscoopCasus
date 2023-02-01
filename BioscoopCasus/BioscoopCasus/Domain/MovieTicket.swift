//
//  MovieTicket.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class MovieTicket: Encodable {
    private let movieScreening: MovieScreening
    private let rowNr: Int
    private let seatNr: Int
    private let isPremium: Bool
    private let isStudentOrder: Bool
    
    init(movieScreening: MovieScreening, rowNr: Int, seatNr: Int, isPremium: Bool, isStudentOrder: Bool) {
        self.movieScreening = movieScreening
        self.rowNr = rowNr
        self.seatNr = seatNr
        self.isPremium = isPremium
        self.isStudentOrder = isStudentOrder
    }
    
    func isPremiumTicket() -> Bool {
        isPremium
    }
    
    func getIsStudentOrder() -> Bool {
        isStudentOrder
    }
    
    func getPrice() -> Double {
        // premium = isStudentOrder ? 2 : 3
        if isPremiumTicket() {
            return movieScreening.getPricePerSeat() + (isStudentOrder ? 2 : 3)
        } else {
            return movieScreening.getPricePerSeat()
        }
    }
    
    func getDateAndTime() -> Date {
        movieScreening.getDateAndTime()
    }
    
    func toString() -> String {
        return ""
    }
}
