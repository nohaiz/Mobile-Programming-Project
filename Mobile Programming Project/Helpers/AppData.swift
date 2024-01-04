//
//  AppData.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import Foundation

class AppData {

    static func createSampleDataLab() -> [LabUser] {
        var sampleDataLab: [LabUser] = []
        
        // Sample data 1
        let labUser1 = LabUser(email: "labuser1@example.com", password: "gnskeqn1")
        sampleDataLab.append(labUser1)
        
        // Sample data 2
        let labUser2 = LabUser(email: "labuser2@example.com", password: "fkdnvo29")
        sampleDataLab.append(labUser2)
        
        // Sample data 3
        let labUser3 = LabUser(email: "labuser3@example.com", password: "dkvmsoe9")
        sampleDataLab.append(labUser3)
        
        // Sample data 4
        let labUser4 = LabUser(email: "labuser4@example.com", password: "dskancv1")
        sampleDataLab.append(labUser4)
        
        // Sample data 5
        let labUser5 = LabUser(email: "labuser5@example.com", password: "bmdk49s0")
        sampleDataLab.append(labUser5)
        
        return sampleDataLab
    }
    
    static func createSampleDataAdmin() -> [AdminUser] {
        var sampleDataAdmin: [AdminUser] = []
        
        // Sample data 1
        let adminUser1 = AdminUser(email: "adminuser1@example.com", password: "vndosjt9")
        sampleDataAdmin.append(adminUser1)
        
        // Sample data 2
        let adminUser2 = AdminUser(email: "adminuser2@example.com", password: "03vn2o90")
        sampleDataAdmin.append(adminUser2)
        
        // Sample data 3
        let adminUser3 = AdminUser(email: "adminuser3@example.com", password: "03jtmn60")
        sampleDataAdmin.append(adminUser3)
        
        // Sample data 4
        let adminUser4 = AdminUser(email: "adminuser4@example.com", password: "cngjet98")
        sampleDataAdmin.append(adminUser4)
        
        // Sample data 5
        let adminUser5 = AdminUser(email: "adminuser5@example.com", password: "1234bhrt")
        sampleDataAdmin.append(adminUser5)
        
        return sampleDataAdmin
    }
    
       static var sampleDataPatient: [PatientUser] = [
        
        // Sample data 1
        PatientUser(fullname: "Ahmed Ali", cpr: "194760938", email: "ahmedali@example.com", password: "ghtnfju8", gender: "Male", date: "November 03 2023"),
        // Sample data 2
        PatientUser(fullname: "Jane Smith", cpr: "285903857", email: "janesmith@example.com", password: "fhtidnj3", gender: "Female", date: "February 15 1990"),
                    
        // Sample data 3
        PatientUser(fullname: "Nohaiz Johnson", cpr: "987653210", email: "nohaizjohnson@example.com", password: "ghnskei8", gender: "Male", date: "October 21 1977"),
        
        // Sample data 4
        PatientUser(fullname: "Emily Davis", cpr: "012456789", email: "emilydavis@example.com", password: "gnjfdji0", gender: "Female", date: "April 3 2005"),
        
        // Sample data 5
        PatientUser(fullname: "Bat Man", cpr: "543109876", email: "batman@example.com", password: "gjvntekt", gender: "Male", date: "December 01 2023"),

        ]
}
