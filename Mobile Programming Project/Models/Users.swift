//
//  Users.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class Users: Equatable, Codable {
    
    //Declaring var
    var username:String
    var cpr:Int
    var email:String
    var password:String
    var gender:String
    var DOB:Date
    
    //A function to compare 2 user instances for equality
    static func == (lhs: Users, rhs: Users) -> Bool {
        return lhs.username == rhs.username && lhs.password == rhs.password
    }
    
    //A constructor when creating a new instance of the user class
    init(username: String, cpr: Int, email: String, password: String, gender: String, DOB: Date) {
        self.username = username
        self.cpr = cpr
        self.email = email
        self.password = password
        self.gender = gender
        self.DOB = DOB
    }
}
