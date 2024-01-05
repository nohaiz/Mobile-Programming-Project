//
//  Patient&Admin&LabViewController.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//
import UIKit

class Patient_Admin_LabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the left bar button item to a "Log out" button with an action
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Log out", style: .plain, target: self, action: #selector(showLogoutAlert))
    }
    // Action method for the "Log out" button
    @objc func showLogoutAlert() {
        // Create an alert controller
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        // Create a logout action
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
            // Perform logout actions here
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginPageTableController") {
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            }
        }
        // Create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Add actions to the alert controller
        alert.addAction(logoutAction)
        alert.addAction(cancelAction)
        
        // Present the alert controller
        present(alert, animated: true, completion: nil)
    }
}
