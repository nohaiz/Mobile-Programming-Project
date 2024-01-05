//
//  Service.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 25/12/2023.
//
import Foundation

class Service: Codable {
    var id: UUID
    var name: String
    var price: Double
    var description: String
    var isFastingRequried: Bool
    
    init(name: String, price: Double, description: String, isFastingRequired: Bool) {
        self.name = name
        self.price = price
        self.description = description
        self.isFastingRequried = isFastingRequired
        self.id = UUID()
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        self.id = try container.decode(UUID.self)
        self.name = try container.decode(String.self)
        self.price = try container.decode(Double.self)
        self.description = try container.decode(String.self)
        self.isFastingRequried = try container.decode(Bool.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(id)
        try container.encode(name)
        try container.encode(price)
        try container.encode(description)
        try container.encode(isFastingRequried)
    }
}



