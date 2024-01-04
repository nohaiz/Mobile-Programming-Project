//
//  Test.swift
//  Booking
//
//  Created by mobileProg on 28/12/2023.
//

import Foundation

class Test {
    var id: UUID
   var testName: String
   var hospitalName: String
   var bookingDate: Date
   var bookingPrice: Double
   var bookingDescription: String
   var fastingPeriod: String


    init(id : UUID, testName: String, hospitalName: String, bookingDate: Date, bookingPrice: Double, bookingDescription: String, fastingPeriod: String) {
        self.id = id
       self.testName = testName
       self.hospitalName = hospitalName
       self.bookingDate = bookingDate
       self.bookingPrice = bookingPrice
       self.bookingDescription = bookingDescription
       self.fastingPeriod = fastingPeriod
   
   }
}
