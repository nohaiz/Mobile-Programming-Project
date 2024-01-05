//
//  Persistence.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import Foundation
import UIKit

extension AppData {
    
    // Enum to represent file names
    fileprivate enum FileName: String {
        case patientFile,tests,packages,services,facilities
    }
    
    // Compute the URL for the archive file
    fileprivate static func archiveURL(fileName: FileName) -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent(fileName.rawValue).appendingPathExtension("plist")
    }
    
    
    // Load data from the archive file
    static func load() {
        loadUsers()
        loadServices(fileName: .tests)
        loadServices(fileName: .packages)
        loadFacilities()
        
        if services.isEmpty{
            services = sampleServices
        }
        
        if facilities.isEmpty{
            facilities = sampleFacilities
        }
    }
    
    // Save data to the archive file
    static func saveToFile() {
        saveUsers()
        saveServices(fileName: .tests)
        saveServices(fileName: .packages)
        saveFacilities()
    }
    
    fileprivate static func loadUsers() {
        let url = archiveURL(fileName: .patientFile)
        guard let data = try? Data(contentsOf: url) else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let decodedUsers = try decoder.decode([PatientUser].self, from: data)
            AppData.sampleDataPatient = decodedUsers
            print("File path: \(url.path)")
        } catch {
            print("Error decoding data: \(error)")
            
        }
    }
    
    fileprivate static func saveUsers() {
        let encoder = PropertyListEncoder()
        do {
            let encodedUsers = try encoder.encode(AppData.sampleDataPatient)
            try encodedUsers.write(to: archiveURL(fileName: .patientFile))
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    fileprivate static func saveServices(fileName: FileName) {
        guard services.count > 0 else { return }
        
        let encoder = PropertyListEncoder()
        do {
            if fileName == .packages {
                let packages : [Package] = services.compactMap{ $0 as? Package }
                if !packages.isEmpty {
                    let encodedPackages = try encoder.encode(packages)
                    try encodedPackages.write(to: archiveURL(fileName: .packages))
                }
            }
            else {
                let tests : [Test] = services.compactMap{ $0 as? Test }
                if !tests.isEmpty {
                    let encodedTests = try encoder.encode(tests)
                    try encodedTests.write(to: archiveURL(fileName: .tests))
                }
            }
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    fileprivate static func loadServices(fileName: FileName) {
        let url = archiveURL(fileName: fileName)
        guard let data = try? Data(contentsOf: url) else { return }
        do {
            let decoder = PropertyListDecoder()
            var decodedServices : [Service] = []
            if fileName == .packages {
                decodedServices = try decoder.decode([Package].self, from: data)
            } else {
                decodedServices = try decoder.decode([Test].self, from: data)
                
            }
            services.append(contentsOf: decodedServices)
        } catch {
            print("Error decoding data: \(error)")
        }
        
    }
    
    
    //Facility functions
    fileprivate static func saveFacilities(){
        guard facilities.count > 0 else {return}
        
        let encoder = PropertyListEncoder()
        do{
            let encodedFacilities = try encoder.encode(facilities)
            try encodedFacilities.write(to: archiveURL(fileName: .facilities))
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    fileprivate static func loadFacilities() {
        let url = archiveURL(fileName: .facilities)
        guard let data = try? Data(contentsOf: url) else { return }
        do {
            let decoder = PropertyListDecoder()
            var decodedFacilities : [Facility] = []
            decodedFacilities = try decoder.decode([Facility].self, from: data)
            facilities.append(contentsOf: decodedFacilities)
        } catch {
            print("Error decoding data: \(error)")
        }
    }
    
}

let completeBloodCount = Test(name: "Complete Blood Count", price: 30.0, description: "Measures different components of the blood.", isFastingRequired: false)
let cholesterolTest = Test(name: "Cholesterol Level Test", price: 25.0, description: "Determine the amount of cholesterol in the blood.", isFastingRequired: true)
let liverFunctionTest = Test(name: "Liver Function Test", price: 35.0, description: "Assesses the health of the liver.", isFastingRequired: false)
let kidneyFunctionTest = Test(name: "Kidney Function Test", price: 40.0, description: "Evaluates the overall function of the kidneys.", isFastingRequired: true)
let vitaminDTest = Test(name: "Vitamin D Level", price: 20.0, description: "Evaluates the level of vitamin D in the blood.", isFastingRequired: false)
let vitaminATest = Test(name: "Vitamin A Level", price: 30.0, description: "Evaluates the level of vitamin A in the blood.", isFastingRequired: false)
let boneDensityTest = Test(name: "Bone Density Test", price: 55.0, description: "Measures bone mineral density for osteoporosis assessment.", isFastingRequired: false)
let ironLevelsTest = Test(name: "Iron Levels Test", price: 40.0, description: "Measures the level of iron in the blood.", isFastingRequired: true)
let allergyScreening = Test(name: "Allergy Screening", price: 65.0, description: "Screening for common allergies.", isFastingRequired: false)
let lungFunctionTest = Test(name: "Lung Function Test", price: 75.0, description: "Assesses the function of the lungs.", isFastingRequired: false)

let package1 = Package(
    name: "Basic Checkup",
    price: 75.0,
    description: "Essential health checkup",
    isFastingRequired: false,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [completeBloodCount, cholesterolTest]
)
let package2 = Package(
    name: "Cardiac Screening",
    price: 120.0,
    description: "Specialized screening for cardiac health",
    isFastingRequired: true,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [cholesterolTest, liverFunctionTest]
)
let package3 = Package(
    name: "Kidney Function Assessment",
    price: 90.0,
    description: "Comprehensive assessment of kidney function",
    isFastingRequired: true,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [kidneyFunctionTest, completeBloodCount]
)
let package4 = Package(
    name: "Vitamin D Check",
    price: 50.0,
    description: "Evaluation of vitamin D levels",
    isFastingRequired: false,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [vitaminDTest, cholesterolTest]
)
let package5 = Package(
    name: "Liver Function Panel",
    price: 95.0,
    description: "Comprehensive liver function assessment",
    isFastingRequired: true,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [liverFunctionTest, kidneyFunctionTest]
)
let package6 = Package(
    name: "Iron and Allergy Assessment",
    price: 95.0,
    description: "Assessment of iron levels and common allergies",
    isFastingRequired: true,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [ironLevelsTest, allergyScreening]
)

let package7 = Package(
    name: "Respiratory Health Check",
    price: 120.0,
    description: "Comprehensive checkup for respiratory health",
    isFastingRequired: false,
    expiryDate: Date().addingTimeInterval(60 * 60 * 24 * Double.random(in: 30...90)),
    includedTests: [lungFunctionTest, vitaminDTest])

private var sampleServices: [Service] = [package1,vitaminDTest,package2,completeBloodCount,cholesterolTest,liverFunctionTest,package3,package4,kidneyFunctionTest,package5,vitaminATest,boneDensityTest,ironLevelsTest,allergyScreening,package6,package7]


private var sampleFacilities: [Facility] = [
    // Hospitals
    Facility(facilityType: .hospital, logo: UIImage(named: "RBHLogo")!, name: "Royal Bahrain Hospital", contactNumber: "17764444", location: "Road 515, Riffa", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!, username: "RBHUser", password: "password777"),
    
    Facility(facilityType: .hospital, logo: UIImage(named: "MOHLogo")!, name: "Salmaniya Medical Complex", contactNumber: "17822222", location: "Road 2435, Salmaniya, Manama", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!, username: "SalmaniyaUser", password: "password123"),
    
    Facility(facilityType: .hospital, logo: UIImage(named: "KHUHLogo")!, name: "King Hamad University Hospital", contactNumber: "17444244", location: "Road 2831, Busaiteen, Muharraq", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!, username: "KHUHUser", password: "password456"),
    
    Facility(facilityType: .hospital, logo: UIImage(named: "BSHLogo")!, name: "Bahrain Specialist Hospital", contactNumber: "17812000", location: "Road 44, Juffair, Manama", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 7, minute: 30, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 16, minute: 30, second: 0, of: Date())!, username: "BSHUser", password: "password789"),
    
    Facility(facilityType: .hospital, logo: UIImage(named: "AMHLogo")!, name: "American Mission Hospital", contactNumber: "17253444", location: "Road 245, Manama", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!, username: "AMHUser", password: "password111"),
    
    // labs
    Facility(facilityType: .lab, logo: UIImage(named: "ABMLLogo")!, name: "Al Borg Medical Laboratories", contactNumber: "17215555", location: "Manama", isAvailable: true, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!, username: "AlBorgUser", password: "pass"),

    Facility(facilityType: .lab, logo: UIImage(named: "ALSLogo")!, name: "ALS Laboratory Group", contactNumber: "17272727", location: "Seef, Manama", isAvailable: true, isAlwaysOpen: true, startTime: Date(), endTime: Date(), username: "ALSLabUser", password: "pass"),
    
    Facility(facilityType: .lab, logo: UIImage(named: "BMLLogo")!, name: "Bahrain Medical Laboratory", contactNumber: "17234567", location: "Gudaibiya, Manama", isAvailable: false, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!, username: "BMLUser", password: "pass"),
    
    Facility(facilityType: .lab, logo: UIImage(named: "HPLogo")!, name: "Healthpoint Laboratory", contactNumber: "17766666", location: "Tubli, Manama", isAvailable: true, isAlwaysOpen: true, startTime: Date(), endTime: Date(), username: "HealthpointUser", password: "pass"),
    
    Facility(facilityType: .lab, logo: UIImage(named: "RBHLogo")!, name: "Royal Bahrain Hospital Laboratory", contactNumber: "17711111", location: "Riffa, Manama", isAvailable: true, isAlwaysOpen: false, startTime: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, endTime: Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())!, username: "RBHUser", password: "pass")
    ]
