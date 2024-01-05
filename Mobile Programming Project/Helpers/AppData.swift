//
//  AppData.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import Foundation

class AppData {

        // An array of sample lab users
        static var sampleDataLab: [LabUser] = [
        
        LabUser(email: "labuser1@gmail.com", password: "gnskeqn1"),
        
        LabUser(email: "labuser2@gmail.com", password: "fkdnvo29"),
        
        LabUser(email: "labuser3@gmail.com", password: "dkvmsoe9"),
        
        LabUser(email: "labuser4@gmail.com", password: "dskancv1"),
        
        LabUser(email: "labuser5@gmail.com", password: "bmdk49s0"),
        
        ]
    
        // An array of sample admin users
        static var sampleDataAdmin: [AdminUser] = [
        
        AdminUser(email: "adminuser1@gmail.com", password: "vndosjt9"),
        
        AdminUser(email: "adminuser2@gmail.com", password: "03vn2o90"),
        
        AdminUser(email: "adminuser3@gmail.com", password: "03jtmn60"),
        
        AdminUser(email: "adminuser4@gmail.com", password: "cngjet98"),
        
        AdminUser(email: "adminuser5@gmail.com", password: "1234bhrt"),
        ]
    
        // An array of sample patient users
       static var sampleDataPatient: [PatientUser] = [
        
        PatientUser(fullname: "Ahmed Ali", cpr: "194760938", email: "ahmedali@gmail.com", password: "ghtnfju8", gender: "Male", date: "November 03 2023"),

        PatientUser(fullname: "Jane Smith", cpr: "285903857", email: "janesmith@hotmail.com", password: "fhtidnj3", gender: "Female", date: "February 15 1990"),
                    
        PatientUser(fullname: "Nohaiz Johnson", cpr: "987653210", email: "nohaizjohnson@gmail.com", password: "ghnskei8", gender: "Male", date: "October 21 1977"),
        
        PatientUser(fullname: "Emily Davis", cpr: "012456789", email: "emilydavis@hotmail.com", password: "gnjfdji0", gender: "Female", date: "April 3 2005"),
        
        PatientUser(fullname: "Bat Man", cpr: "543109876", email: "batman@gmail.com", password: "gjvntekt", gender: "Male", date: "December 01 2023"),

        ]
}
