//
//  AppData.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import Foundation

class AppData {
    static var patientServices: [Services] = []
    static var services: [Service] = []
    static var facilities = [Facility]()

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
        
        PatientUser(fullname: "Bat Man", cpr: "543109876", email: "123", password: "123", gender: "Male", date: "December 01 2023"),

        ]
    
    static func addSampleServices() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"

        let servicesToAdd = [
           Services(name: "Complete Blood Count (CBC)", price: 12.0, description: "Full blood count test including WBC, RBC, Hemoglobin.", isFastingRequired: false, isPromoted: true, isRecent: true, popularityScore: 95, date: dateFormatter.date(from: "2024/01/01")!, hospitalName: "King Hamad Medical City"),
           Services(name: "Lipid Profile", price: 15.0, description: "Measures cholesterol levels in the blood.", isFastingRequired: true, isPromoted: false, isRecent: true, popularityScore: 80, date: dateFormatter.date(from: "2024/01/02")!, hospitalName: "Salmaniya Medical Complex"),
           Services(name: "Thyroid Function Test", price: 18.0, description: "Tests for T3, T4, and TSH hormones.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 85, date: dateFormatter.date(from: "2024/01/03")!, hospitalName: "Al Qudsi Hospital"),
           Services(name: "Liver Function Test", price: 20.0, description: "Analyzes enzymes and proteins related to liver function.", isFastingRequired: true, isPromoted: false, isRecent: true, popularityScore: 75, date: dateFormatter.date(from: "2024/01/04")!, hospitalName: "Bahrain Specialist Hospital"),
           Services(name: "Renal Function Panel", price: 22.0, description: "Assesses kidney function and electrolyte levels.", isFastingRequired: true, isPromoted: false, isRecent: true, popularityScore: 70, date: dateFormatter.date(from: "2024/01/05")!, hospitalName: "The Bahrain Clinic"),
           Services(name: "Hemoglobin A1c", price: 25.0, description: "Provides average level of blood sugar over the past 3 months.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 90, date: dateFormatter.date(from: "2024/01/06")!, hospitalName: "Al Noor Hospital"),
           Services(name: "Vitamin D Test", price: 28.0, description: "Measures the level of Vitamin D in the blood.", isFastingRequired: false, isPromoted: true, isRecent: true, popularityScore: 88, date: dateFormatter.date(from: "2024/01/07")!, hospitalName: "Dr. Sulaiman Al Habib Hospital"),
           Services(name: "Prostate-Specific Antigen (PSA)", price: 30.0, description: "Screening for prostate cancer in men.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 65, date: dateFormatter.date(from: "2024/01/08")!, hospitalName: "Bahrain Heart Institute"),
           Services(name: "Electrolyte Panel", price: 15.0, description: "Measures electrolytes such as sodium, potassium.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 78, date: dateFormatter.date(from: "2024/01/09")!, hospitalName: "Bahrain Eye Hospital"),
           Services(name: "Bone Density Scan", price: 50.0, description: "Assesses bone health and risk of fractures.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 60, date: dateFormatter.date(from: "2024/01/10")!, hospitalName: "Bahrain Heart Institute"),
           Services(name: "Allergy Testing", price: 40.0, description: "Identifies specific allergens causing allergies.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 82, date: dateFormatter.date(from: "2024/01/11")!, hospitalName: "Al Maktoum Hospital"),
           Services(name: "Echocardiogram", price: 100.0, description: "Ultrasound of the heart to assess its function and structure.", isFastingRequired: false, isPromoted: false, isRecent: true, popularityScore: 77, date: dateFormatter.date(from: "2024/01/12")!, hospitalName: "Bahrain Eye Hospital"),
           Services(name: "Mammography", price: 55.0, description: "X-ray imaging of the breast for cancer screening.", isFastingRequired: false, isPromoted: true, isRecent: true, popularityScore: 69, date: dateFormatter.date(from: "2024/01/13")!, hospitalName: "Dr. Sulaiman Al Habib")
        ]


           for service in servicesToAdd {
               patientServices.append(service)
           }
           saveToFile()
       }
}



extension AppData{
    
    //Service modification
    static func deleteService(service: Service){
        if let index = services.firstIndex(where: { $0.id == service.id}){
            
            //If the service is a test, it will be deleted from all packages
            if service is Test
            {
                for otherService in services
                {
                    if let package = otherService as? Package
                    {
                        if let testIndex = package.includedTests.firstIndex(where: { $0.id == service.id }) {
                            package.includedTests.remove(at: testIndex)
                        }
                    }
                }
            }
                    
            
            services.remove(at: index)
            saveToFile()
        }
    }

    static func addService(service: Service){
        services.append(service)
        saveToFile()
    }
    
    static func addService(service: Services){
        patientServices.append(service)
        saveToFile()
    }

    static func editService(service: Service){
        if let index = services.firstIndex(where: { $0.id == service.id}) {
           
            //If the service is a test, it will be deleted from all packages
            if service is Test
            {
                for otherService in services
                {
                    if let package = otherService as? Package
                    {
                        if let testIndex = package.includedTests.firstIndex(where: { $0.id == service.id }) {
                            package.includedTests[testIndex] = service as! Test
                        }
                    }
                }
            }
            services[index] = service
            saveToFile()
        }
    }
        
    static func addTestInPackage(test: Service, package: Service) {
        if let sTest = test as? Test, let sPackage = package as? Package{
            sPackage.includedTests.append(sTest)
        }
        saveToFile()
    }
    
    static func loginUser(user: User) { //logs in the user
        
        let def = UserDefaults.standard
        def.set(true, forKey: "is_authenticated") // save true flag to UserDefaults
        
        if user is AdminUser {
            def.set(true, forKey: "isAdmin")
            
        }else if user is LabUser {
            def.set(true, forKey: "isLabs")
            
        }else if user is PatientUser{
            def.set(true, forKey: "isPatient")
        }
        def.synchronize()
        
    }
    static func logoutUser() { //logs out the user
        let defaults = UserDefaults.standard
        
        // Update the state by changing the values of specific keys
        defaults.set(false, forKey: "is_authenticated")
        defaults.set(false, forKey: "isAdmin")
        defaults.set(false, forKey: "isLabs")
        defaults.set(false, forKey: "isPatient")
        
        defaults.synchronize()
        
        // Remove any additional objects from user defaults
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key != "is_authenticated" && key != "isAdmin" && key != "isLabs" && key != "isPatient" {
                defaults.removeObject(forKey: key)
            }
        }
        
        defaults.synchronize()
    }
    
    
    //Facilities
    static func deleteFacility(facility: Facility){
        if let index = facilities.firstIndex(where: { $0.id == facility.id}){
            facilities.remove(at: index)
            saveToFile()
        }
    }
    
    static func addFacility(facility: Facility){
        facilities.append(facility)
        saveToFile()
    }
    
    static func editFacility(facility: Facility){
        if let index = facilities.firstIndex(where: { $0.id == facility.id}) {
            facilities[index] = facility
            saveToFile()
        }
    }
}
