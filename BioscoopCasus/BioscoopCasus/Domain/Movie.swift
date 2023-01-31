//
//  Movie.swift
//  BioscoopCasus
//
//  Created by Bas Buijsen on 31/01/2023.
//

import Foundation

class Movie {
    private let title: String
    private var screenings: [MovieScreening]
    
    init(title: String) {
        self.title = title
        self.screenings = []
    }
    
    func addScreening(screening: MovieScreening) {
        screenings += [screening]
    }
    
    func toString() -> String {
        return ""
    }
}
