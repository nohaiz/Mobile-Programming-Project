//
//  Package.swift
//  Booking
//
//  Created by mobileProg on 28/12/2023.
//

import Foundation

class Package {
 var id: UUID
 var packageName: String
 var hospitalName: String
 var bookingDate: Date
 var bookingPrice: Double
 var bookingDescription: String
 var fastingPeriod: String
 var testList: String
 var expirationDate: Date

 init(id: UUID, packageName: String, hospitalName: String, bookingDate: Date, bookingPrice: Double, bookingDescription: String, fastingPeriod: String, testList: String, expirationDate: Date) {
  self.id = id
  self.packageName = packageName
  self.hospitalName = hospitalName
  self.bookingDate = bookingDate
  self.bookingPrice = bookingPrice
  self.bookingDescription = bookingDescription
  self.fastingPeriod = fastingPeriod
  self.testList = testList
  self.expirationDate = expirationDate
 }

 static func dummyData() -> [Package] {
  let calendar = Calendar.current

  // Dummy data for package with 7 days expiration
  let sevenDaysExpirationDate = calendar.date(byAdding: .day, value: 7, to: Date())!

  // Dummy data for package with 30 days expiration
  let thirtyDaysExpirationDate = calendar.date(byAdding: .day, value: 30, to: Date())!

  // Dummy data for package with 60 days expiration
  let sixtyDaysExpirationDate = calendar.date(byAdding: .day, value: 60, to: Date())!

  let package1 = Package(id: UUID(), packageName: "Package 1", hospitalName: "Hospital A", bookingDate: Date(), bookingPrice: 100.0, bookingDescription: "Package Description", fastingPeriod: "Before breakfast", testList: "Test 1, Test 2", expirationDate: sevenDaysExpirationDate)
  let package2 = Package(id: UUID(), packageName: "Package 2", hospitalName: "Hospital B", bookingDate: Date(), bookingPrice: 200.0, bookingDescription: "Package Description", fastingPeriod: "After lunch", testList: "Test 3, Test 4", expirationDate: thirtyDaysExpirationDate)
  let package3 = Package(id: UUID(), packageName: "Package 3", hospitalName: "Hospital C", bookingDate: Date(), bookingPrice: 300.0, bookingDescription: "Package Description", fastingPeriod: "Before dinner", testList: "Test 5, Test 6", expirationDate: sixtyDaysExpirationDate)

  return [package1, package2, package3]
 }
}

