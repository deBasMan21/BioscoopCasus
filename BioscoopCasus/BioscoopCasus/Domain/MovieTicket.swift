//
//  MovieTicket.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class MovieTicket {
    private let rowNr: Int
    private let seatNr: Int
    private let isPremium: Bool
    
    init(rowNr: Int, seatNr: Int, isPremium: Bool) {
        self.rowNr = rowNr
        self.seatNr = seatNr
        self.isPremium = isPremium
    }
    
    func isPremiumTicket() -> Bool {
        isPremium
    }
    
    func getPrice() -> Double {
        return 0
    }
    
    func toString() -> String {
        return ""
    }
}
