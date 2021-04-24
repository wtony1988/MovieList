//
//  Movie.swift
//  BaseProject
//
//  Created by Tony Wang on 4/13/21.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id = UUID()
    var title: String
    var openingCrawl: String
    var director: String
    var producer: String
    let created: Date
    var characterLinks: [String] = []
    var charactersInMovie = [Character]()
    
    enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
        case created
        case director
        case producer
        case characterLinks = "characters"
    }
    
    init(title: String, openingCrawl: String) {
        self.title  = title
        self.openingCrawl = openingCrawl
        self.director = ""
        self.producer = ""
        self.created  = Date()
    }
}

struct Movies: Codable {
    var results: [Movie]
}
