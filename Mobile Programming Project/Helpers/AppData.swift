//
//  AppData.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation

class AppData {
    
    static func createSampleDataLab() -> [LabUser] {
        var sampleData: [LabUser] = []
        
        // Sample data 1
        let labUser1 = LabUser(email: "labuser1@example.com", password: "password1")
        sampleData.append(labUser1)
        
        // Sample data 2
        let labUser2 = LabUser(email: "labuser2@example.com", password: "password2")
        sampleData.append(labUser2)
        
        // Sample data 3
        let labUser3 = LabUser(email: "labuser3@example.com", password: "password3")
        sampleData.append(labUser3)
        
        // Sample data 4
        let labUser4 = LabUser(email: "labuser4@example.com", password: "password4")
        sampleData.append(labUser4)
        
        // Sample data 5
        let labUser5 = LabUser(email: "labuser5@example.com", password: "password5")
        sampleData.append(labUser5)
        
        return sampleData
    }
    
    static func createSampleDataAdmin() -> [AdminUser] {
        var sampleData: [AdminUser] = []
        
        // Sample data 1
        let adminUser1 = AdminUser(email: "adminuser1@example.com", password: "password1")
        sampleData.append(adminUser1)
        
        // Sample data 2
        let adminUser2 = AdminUser(email: "adminuser2@example.com", password: "password2")
        sampleData.append(adminUser2)
        
        // Sample data 3
        let adminUser3 = AdminUser(email: "adminuser3@example.com", password: "password3")
        sampleData.append(adminUser3)
        
        // Sample data 4
        let adminUser4 = AdminUser(email: "adminuser4@example.com", password: "password4")
        sampleData.append(adminUser4)
        
        // Sample data 5
        let adminUser5 = AdminUser(email: "adminuser5@example.com", password: "password5")
        sampleData.append(adminUser5)
        
        return sampleData
    }
}
