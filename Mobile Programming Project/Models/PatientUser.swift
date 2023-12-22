//
//  PatientUser.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class PatientUser{
    
    var fullname:String
    var cpr:String
    var email:String
    var password:String
    var confirmPassowrd:String
    var gender:String
    var date:Date
    
    init(fullname: String, cpr: String, email: String, password: String, confirmPassowrd: String, gender: String, date: Date) {
        self.fullname = fullname
        self.cpr = cpr
        self.email = email
        self.password = password
        self.confirmPassowrd = confirmPassowrd
        self.gender = gender
        self.date = date
    }
}

