//
//  Alerts.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation
import UIKit


func displayIncorrectCredentialsAlert() {
    let alert = UIAlertController(title: "Incorrect Credentials", message: "Invalid username or password.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displayMismatchPasswordsAlert() {
    let alert = UIAlertController(title: "Passwords Incorrect", message: "Password authentication unsuccessful or password does not meet required length of 8", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displayErrorIfEmpty() {
    let alert = UIAlertController(title: "Empty Fields", message: "Please ensure that both the username and password fields are populated.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displaysErrorIfNotInt() {
    let alert = UIAlertController(title: "Error", message: "Please provide a valid CPR number", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func isValidEmail(email: String) -> Bool {
       let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
       return emailPredicate.evaluate(with: email)
   }

func displayInvalidEmailAlert() {
    let alert = UIAlertController(title: "Error", message: "Please provide a valid email address", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displayErrorName() {
    let alert = UIAlertController(title: "Error", message: "Please provide a valid name consisting of alphabetical characters only.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displayDOBNotSelectedAlert() {
    let alert = UIAlertController(title: "Error", message: "Please provide your date of birth.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func displayGenderNotSelectedAlert() {
    let alert = UIAlertController(title: "Error", message: "Please provide your gender.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

//Services alerts
extension UIViewController{
    
    func confirmAction(title: String,message: String?,confirmHandler: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Yes", style: .default) { UIAlertAction in
            confirmHandler()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func discardAlert(title: String,message: String?,confirmHandler: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Discard", style: .destructive) { UIAlertAction in
            confirmHandler()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func deleteAlert(title: String,message: String?,confirmHandler: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Delete", style: .destructive) { UIAlertAction in
            confirmHandler()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func selectTestAlert() {
        let alert = UIAlertController(title: "Select a Test", message: "Please select a test before saving the package.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

