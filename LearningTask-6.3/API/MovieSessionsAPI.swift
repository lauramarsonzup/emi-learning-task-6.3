//
//  MovieSessionsAPI.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 15/04/2022.
//

import Foundation

class MovieSessionsAPI {
    
    func getSessionBy(_ movie: Movie) -> [Sessions] {
        let comingSessions = [
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 75, to: .now)!,
                    type: .subtitled, movie: movie),
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 150, to: .now)!,
                    type: .dubbed, movie: movie),
            Session(dateTime: Calendar.current.date(byAdding: .minute, value: 225, to: .now)!,
                    type: .subtitled, movie: movie),
        ]
        
        return [
            Sessions(comingSessions, by: Cinema(name: "Cinemark Boulevard Tatuapé", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Cinemark Eldorado", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Cinemark Paulista", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Cinépolis JK Iguatemi", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Espaço Itaú de Cinema - Pompéia", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Kinoplex Itaim", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "Kinoplex Vila Olímpia", favorite: false)),
            Sessions(comingSessions, by: Cinema(name: "UCI Anália Franco", favorite: false)),
        ]
        
    }
}
