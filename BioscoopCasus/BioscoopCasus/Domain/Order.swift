//
//  Order.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation
import Algorithms

class Order: Encodable, CustomStringConvertible {
    private let orderNr: Int
    private var tickets: [MovieTicket]
    
    var isStudentOrder: Bool {
        tickets.filter { $0.getIsStudentOrder() }.count > 0
    }
    var description: String {
        "Order Number: \(orderNr)\nIs student order: \(isStudentOrder)\nTickets: \(tickets.count)"
    }
    
    init(orderNr: Int) {
        self.orderNr = orderNr
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
            FileUtils.exportJSON(self)
        case TicketExportFormat.PLAINTEXT:
            FileUtils.exportPlainText(self)
        }
    }
}
