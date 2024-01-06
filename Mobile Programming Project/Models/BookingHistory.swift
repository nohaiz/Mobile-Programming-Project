//
//  BookingHistory.swift
//  Booking
//
//  Created by mobileProg on 12/12/2023.
//

import Foundation


class BookingHistory : Encodable, Decodable {
   var status: String
    var id: UUID
   var hospitalName: String
   var testName: String
   var testDate: String

    init(status: String, hospitalName: String, testName: String, testDate: String) {
        self.id = UUID()
        self.status = status
       self.hospitalName = hospitalName
       self.testName = testName
       self.testDate = testDate
        
   }
    

    
    static var sampleData: [BookingHistory] = [
        BookingHistory(status: "Pending", hospitalName: "Salmaniya Medical Complex", testName: "Blood Test", testDate: "12/01/2023 09:30"),
        BookingHistory(status: "Cancelled", hospitalName: "King Hamad University Hospital", testName: "X-ray", testDate: "13/01/2023 14:15"),
        BookingHistory(status: "Completed", hospitalName: "Bahrain Defense Force Hospital", testName: "MRI Scan", testDate: "13/01/2023 16:45"),
        BookingHistory(status: "Pending", hospitalName: "Ibn Al-Nafees Hospital", testName: "Ultrasound", testDate: "13/01/2023 10:00"),
        BookingHistory(status: "Cancelled", hospitalName: "Royal Bahrain Hospital", testName: "ECG", testDate: "13/01/2023 11:30"),
        BookingHistory(status: "Completed", hospitalName: "American Mission Hospital", testName: "Blood Pressure Check", testDate: "13/01/2023 13:00"),
        BookingHistory(status: "Completed", hospitalName: "Al Kindi Specialised Hospital", testName: "Cholesterol Test", testDate: "13/01/2023 15:30"),
        BookingHistory(status: "Cancelled", hospitalName: "Gulf Diabetes Specialist Center", testName: "Glucose Test", testDate: "14/01/2023 12:45")
    ]

    }



