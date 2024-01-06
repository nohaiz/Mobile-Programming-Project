//
//  SceneDelegate.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 12/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let def = UserDefaults.standard
            let loggedIn = def.bool(forKey: "is_authenticated")
            let isAdminUser = def.bool(forKey: "isAdmin")
            let isLabUser = def.bool(forKey: "isLabs")
            let isPatientUser = def.bool(forKey: "isPatient")
            
            if loggedIn {
                // user logged in
                var rootVC: UIViewController?
                if isAdminUser {
                    // Instantiate Admin view controller and set it as rootVC
                } else if isLabUser {
                    // Instantiate Lab view controller and set it as rootVC
                } else if isPatientUser {
                    // Instantiate Patient view controller with custom initializer
                    let storyboard = UIStoryboard(name: "Patient", bundle: nil)
                    if let patientVC = storyboard.instantiateViewController(withIdentifier: "patientHomePage") as? patientHomePage {
                        // Assuming you have a way to get the current PatientUser object
                        let currentUser = getPatientUser()
                        patientVC.user = currentUser
                        rootVC = patientVC
                    }
                }
                
                if let windowScene = scene as? UIWindowScene {
                    self.window = UIWindow(windowScene: windowScene)
                    self.window?.rootViewController = rootVC
                    self.window?.makeKeyAndVisible()
                }
            }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func getPatientUser() -> PatientUser? {
       // Retrieve the user data from wherever you're storing it
       // This could be from UserDefaults, a database, a server, etc.
       let userData = UserDefaults.standard.object(forKey: "CurrentUser") as? Data

       // Decode the user data into a PatientUser object
       let decoder = JSONDecoder()
       if let userData = userData, let user = try? decoder.decode(PatientUser.self, from: userData) {
           return user
       } else {
           return nil
       }
    }


}

