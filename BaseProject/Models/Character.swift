//
//  Character.swift
//  BaseProject
//
//  Created by Tony Wang on 4/18/21.
//

import Foundation

struct Character: Codable, Identifiable {
    var id = UUID()
    var name: String
    var gender: String
    var height: String
    let created: Date
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case height
        case created
    }
    
    init(name: String, gender: String, height: String, created: Date) {
        self.name  = name
        self.gender = gender
        self.height = height
        self.created = created
    }
}
