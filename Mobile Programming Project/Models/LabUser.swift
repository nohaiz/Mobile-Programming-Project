//
//  LabUser.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class LabUser: Encodable, Decodable{
    
    var email:String
    var password:String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
