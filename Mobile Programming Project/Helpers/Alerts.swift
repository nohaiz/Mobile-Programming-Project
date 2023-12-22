//
//  Alerts.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import Foundation
import UIKit

func displayIncorrectCredentialsAlert() {
    let alert = UIAlertController(title: "Incorrect Credentials", message: "The username or password is incorrect.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the topmost window scene
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        // Get the windows associated with the scene
        if let topWindow = windowScene.windows.first {
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
