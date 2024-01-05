//
//  LoginTableViewCell.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 14/12/2023.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var patient = AppData.sampleDataPatient
    
    override func viewDidLoad() {
        AppData.load()
        dismissKeyboard()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
    }
    
    // Configure the text fields with admin user details
    func configureAdminUsers(AdminUser: AdminUser) {
        usernameTextfield.text = AdminUser.email
        passwordTextfield.text = AdminUser.password
    }
    
    // Configure the text fields with lab user details
    func configureLabUsers(LabUser: LabUser) {
        usernameTextfield.text = LabUser.email
        passwordTextfield.text = LabUser.password
    }
    
    // Configure the text fields with patient user details
    func configurePatientUsers(PatientUsers: PatientUser) {
        usernameTextfield.text = PatientUsers.email
        passwordTextfield.text = PatientUsers.password
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {

        // Get the entered email and password from the text fields
        guard let email = usernameTextfield.text, let password = passwordTextfield.text else {
            return
        }
        
        // Check if the entered email and password match any admin user in the AppData
        if let matchedAdminUser = AppData.sampleDataAdmin.first(where: { $0.email == email && $0.password == password }) {
            performSegue(withIdentifier: "adminPage", sender: Any?.self)
            print("Admin user logged in: \(matchedAdminUser.email)")
            return // Exit the function after performing the segue
        }
        
        // Check if the entered email and password match any lab user in the AppData
        if let matchedLabUser = AppData.sampleDataLab.first(where: { $0.email == email && $0.password == password }) {
            performSegue(withIdentifier: "labPage", sender: Any?.self)
            print("Lab user logged in: \(matchedLabUser.email)")
            return // Exit the function after performing the segue
        }
        // Check if the entered email and password match any lab user in the AppData
        if let matchedPatientUser = AppData.sampleDataPatient.first(where: { $0.email == email && $0.password == password }) {
            performSegue(withIdentifier: "patientPage", sender: Any?.self)
            print("Patient user logged in: \(matchedPatientUser.email)")
            return // Exit the function after performing the segue
        }
        
        // No match found, display the alert
        if usernameTextfield.text?.isEmpty ?? true || passwordTextfield.text?.isEmpty ?? true {
            
            displayErrorIfEmpty()
        }
        else {
            displayIncorrectCredentialsAlert()
        }
    }
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

}

