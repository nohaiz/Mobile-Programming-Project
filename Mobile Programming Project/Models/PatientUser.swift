//
//  PatientUser.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class PatientUser: Encodable, Decodable{
    
    var fullname:String
    var cpr:String
    var email:String
    var password:String
    var gender:String
    var date:String
    
    init(fullname: String, cpr: String, email: String, password: String, gender: String, date: String) {
        self.fullname = fullname
        self.cpr = cpr
        self.email = email
        self.password = password
        self.gender = gender
        self.date = date
    }
}

