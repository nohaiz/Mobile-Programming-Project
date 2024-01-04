//
//  Persistence.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import Foundation

extension AppData {
    
    fileprivate enum FileName: String {
        case patientFile
    }
    
    fileprivate static func archiveURL(fileName: FileName) -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent(fileName.rawValue).appendingPathExtension("plist")
    }
    
    
    static func load() {
        loadUsers()
    }
    
    static func saveToFile() {
        saveUsers()
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
}
