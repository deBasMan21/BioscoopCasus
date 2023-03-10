//
//  main.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"
if let date = formatter.date(from: "2023-01-27") {
    let order = Order(orderNr: 1)
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    order.addSeatReservation(ticket: MovieTicket(movieScreening: MovieScreening(dateAndTime: date, pricePerSeat: 10), rowNr: 1, seatNr: 1, isPremium: false, isStudentOrder: true))
    print(order.calculatePrice())
    order.export(exportFormat: TicketExportFormat.JSON)
    order.export(exportFormat: TicketExportFormat.PLAINTEXT)
}
