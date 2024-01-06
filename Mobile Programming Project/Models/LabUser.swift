//
//  LabUser.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class LabUser: User, Encodable, Decodable{
    
    // Define properties of the PatientUser class
    var email:String
    var password:String
    
    // Initialize the PatientUser object with the provided values
    init(email: String, password: String) {
        self.email = email
        self.password = password
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}
