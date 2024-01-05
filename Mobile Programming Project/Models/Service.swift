//
//  PackageAndTest.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 25/12/2023.
//

import Foundation

import Foundation

class Test: Service {
    // Empty subclass inheritance
}

class Package: Service {
    var expiryDate: Date
    var includedTests: [Test] = []
    
    init(name: String, price: Double, description: String, isFastingRequired: Bool, expiryDate: Date, includedTests: [Test]) {
        self.expiryDate = expiryDate
        self.includedTests = includedTests
        super.init(name: name, price: price, description: description, isFastingRequired: isFastingRequired)
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.expiryDate = try container.decode(Date.self)
        self.includedTests = try container.decode([Test].self)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(expiryDate)
        try container.encode(includedTests)
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)    }
}
