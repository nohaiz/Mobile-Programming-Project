//
//  Keys.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

enum SegueId: String {
    case loginPage
    case adminPage
    case viewTest
    case addTest
    case unwindToServices
    case unwindToServiceForm
    case unwindToFacilities
}

enum Cell: String {
    case ServiceCell
    case TestCell
    case ViewTestCell
    case FacilityCell
}

enum ServiceType: Int{
    case Package = 0
    case Test = 1
}
