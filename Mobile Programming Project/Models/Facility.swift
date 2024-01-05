//
//  Facility.swift
//  Mobile Programming Project
//
//  Created by Mohamed Hasan Alaam on 27/12/2023.
//

import Foundation
import UIKit

class Facility: Codable{
    var facilityType: FacilityType
    var logoData: Data
    var logo: UIImage? {
            return UIImage(data: logoData)
        }
    var id: UUID
    var name: String
    var contactNumber: String
    var location: String
    var isAvailable: Bool
    var isAlwaysOpen: Bool
    var startTime : Date?
    var endTime : Date?
    var username: String
    var password: String
    
    init(facilityType: FacilityType, logo: UIImage, name: String, contactNumber: String, location: String,isAvailable: Bool, isAlwaysOpen: Bool, startTime: Date? , endTime: Date? , username: String, password: String) {
        self.facilityType = facilityType
        self.logoData = logo.pngData() ?? Data()
        self.id = UUID()
        self.name = name
        self.contactNumber = contactNumber
        self.location = location
        self.isAvailable = isAvailable
        self.isAlwaysOpen = isAlwaysOpen
        if (startTime == nil && endTime == nil){
            self.startTime = Calendar.current.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!
            self.endTime = Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date())!}
        else{
            self.startTime = startTime!
            self.endTime = endTime!
        }
        self.username = username
        self.password = password
    }
    
       func encode(to encoder: Encoder) throws {
           var container = encoder.unkeyedContainer()
           try container.encode(facilityType)
           try container.encode(logoData)
           try container.encode(id)
           try container.encode(name)
           try container.encode(contactNumber)
           try container.encode(location)
           try container.encode(isAvailable)
           try container.encode(isAlwaysOpen)
           try container.encode(startTime)
           try container.encode(endTime)
           try container.encode(username)
           try container.encode(password)
       }
       
       required init(from decoder: Decoder) throws {
           var container = try decoder.unkeyedContainer()
           facilityType = try container.decode(FacilityType.self)
           logoData = try container.decode(Data.self)
           id = try container.decode(UUID.self)
           name = try container.decode(String.self)
           contactNumber = try container.decode(String.self)
           location = try container.decode(String.self)
           isAvailable = try container.decode(Bool.self)
           isAlwaysOpen = try container.decode(Bool.self)
           startTime = try container.decodeIfPresent(Date.self)
           endTime = try container.decodeIfPresent(Date.self)
           username = try container.decode(String.self)
           password = try container.decode(String.self)
       }
   }


enum FacilityType: Codable{
    case hospital
    case lab
}
