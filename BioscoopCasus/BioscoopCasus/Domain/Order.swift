//
//  Order.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class Order {
    private let orderNr: Int
    private let isStudentOrder: Bool
    
    init(orderNr: Int, isStudentOrder: Bool) {
        self.orderNr = orderNr
        self.isStudentOrder = isStudentOrder
    }
    
    func getOrderNr() -> Int {
        orderNr
    }
    
    func addSeatReservation(ticket: MovieTicket) {
        print("ticket \(ticket)")
    }
    
    func calculatePrice() -> Double {
        return 0
    }
    
    func export(exportFormat: TicketExportFormat) {
        print("export")
    }
}
