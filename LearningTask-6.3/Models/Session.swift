//
//  Session.swift
//  LearningTask-6.3
//
//  Created by Laura Pinheiro Marson on 04/11/22.
//

import Foundation

struct Sessions {
    let movieSessions: [Session]
    let cinema: Cinema
    
    init(_ sessions: [Session], by cinema: Cinema) {
        self.movieSessions = sessions
        self.cinema = cinema
    }
}

struct Session {
    let dateTime: Date
    let type: SessionType
    let movie: Movie
    
    enum SessionType: String {
        case subtitled = "Legendado"
        case dubbed = "Dublado"
    }
}
