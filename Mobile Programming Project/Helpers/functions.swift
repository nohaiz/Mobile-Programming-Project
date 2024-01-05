//
//  functions.swift
//  Mobile Programming Project
//
//  Created by Ali Alfardan on 05/01/2024.
//

import UIKit

extension UIViewController {
    func goToStoryboard(storyboardName: String, identifier: String) {
           let root = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
           let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
           sceneDelegate.window?.rootViewController = root
       }
}

struct CommonMethods {
    static func goToStoryboard(storyboardName: String, identifier: String) {
        let root = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = root
        
    }
}
