//
//  Movie.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 15/04/2022.
//

import Foundation

struct Movie {
    let backgroundImage: String
    let posterImage: String
    let title: String
    let rating: MovieRating
    let duration: TimeInterval
    let criticsScore: Int
    let publicScore: Int
    
    init(backgroundImage: String, posterImage: String, title: String, rating: MovieRating, durationInMinutes: Double, criticsScore: Int, publicScore: Int) {
        self.backgroundImage = backgroundImage
        self.posterImage = posterImage
        self.title = title
        self.rating = rating
        self.duration = durationInMinutes * 60
        self.criticsScore = criticsScore
        self.publicScore = publicScore
    }
}

enum MovieRating: String, RawRepresentable {
    case free = "L"
    case notRecommendedUnder10 = "10"
    case notRecommendedUnder12 = "12"
    case notRecommendedUnder14 = "14"
    case notRecommendedUnder16 = "16"
    case notRecommendedUnder18 = "18"
}

