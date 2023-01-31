//
//  Order.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation
import Algorithms

class Order: Encodable {
    private let orderNr: Int
    private var tickets: [MovieTicket]
    private let isStudentOrder: Bool
    
    init(orderNr: Int, isStudentOrder: Bool) {
        self.orderNr = orderNr
        self.isStudentOrder = isStudentOrder
        self.tickets = []
    }
    
    func getOrderNr() -> Int {
        orderNr
    }
    
    func addSeatReservation(ticket: MovieTicket) {
        tickets += [ticket]
    }
    
    func calculatePrice() -> Double {
        var prices = tickets.compactMap {
            var price = $0.getPrice()
            
            // premium = isStudentOrder ? 2 : 3
            if $0.isPremiumTicket() {
                price += isStudentOrder ? 2 : 3
            }
            
            // !isStudentOrder && tickets.count >= 6 && vr/za/zo -> 10% korting
            if !isStudentOrder && tickets.count >= 6 && $0.getDateAndTime().isWeekend() {
                price *= 0.9
            }
            
            return price
        }
        
        // isStudentOrder -> 2e gratis
        // ma/di/wo/do -> iedereen 2e gratis
        if isStudentOrder || !(tickets.first?.getDateAndTime().isWeekend() ?? false) {
            prices = prices.chunks(ofCount: 2).compactMap { Array($0).first }
        }
        
        return prices.reduce(0, +)
    }
    
    func export(exportFormat: TicketExportFormat) {
        switch exportFormat {
        case TicketExportFormat.JSON:
            exportJSON()
        case TicketExportFormat.PLAINTEXT:
            print("todo")
        }
    }
    
    private func exportJSON() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(self)
            let json = String(data: data, encoding: .utf8)
            
            if let json = String(data: data, encoding: .utf8) {
                let path = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
                let pathFile = path.appendingPathComponent("Order.json")
                try json.write(to: pathFile, atomically: true, encoding: .utf8)
            }
        } catch let error {
            print(error)
        }

    }
}


