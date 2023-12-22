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

    override func viewDidLoad() {
    }
    
    func configureAdminUsers(AdminUser: AdminUser) {
        usernameTextfield.text = AdminUser.email
        passwordTextfield.text = AdminUser.password
    }
    
    func configureLabUsers(LabUser: LabUser) {
        usernameTextfield.text = LabUser.email
        passwordTextfield.text = LabUser.password
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        // Get the entered email and password from the text fields
        guard let email = usernameTextfield.text, let password = passwordTextfield.text else {
            return
        }
        
        // Check if the entered email and password match any admin user in the AppData
        if let matchedAdminUser = AppData.createSampleDataAdmin().first(where: { $0.email == email && $0.password == password }) {
            performSegue(withIdentifier: "adminPage", sender: Any?.self)
            print("Admin user logged in: \(matchedAdminUser.email)")
            return // Exit the function after performing the segue
        }
        
        // Check if the entered email and password match any lab user in the AppData
        if let matchedLabUser = AppData.createSampleDataLab().first(where: { $0.email == email && $0.password == password }) {
            performSegue(withIdentifier: "labPage", sender: Any?.self)
            print("Lab user logged in: \(matchedLabUser.email)")
            return // Exit the function after performing the segue
        }
        
        // No match found, display the alert
        displayIncorrectCredentialsAlert()
    }


    }

