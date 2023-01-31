//
//  Order.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class Order: Encodable {
    private let orderNr: Int
    private let isStudentOrder: Bool
    private var tickets: [MovieTicket]
    
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
        return 0
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
