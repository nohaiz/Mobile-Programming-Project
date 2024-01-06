//
//  PatientUser.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class PatientUser: User, Encodable, Decodable{
    
    // Define properties of the PatientUser class
    var fullname:String
    var cpr:String
    var email:String
    var password:String
    var gender:String
    var date:String
    
    // Initialize the PatientUser object with the provided values
    init(fullname: String, cpr: String, email: String, password: String, gender: String, date: String) {
        self.fullname = fullname
        self.cpr = cpr
        self.email = email
        self.password = password
        self.gender = gender
        self.date = date
        super.init()
        
    }
    
    
}

