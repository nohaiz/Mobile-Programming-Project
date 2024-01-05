//
//  patientSettings.swift
//  Mobile Programming Project
//
//  Created by Ali Alfardan on 18/12/2023.
//

import UIKit

class patientSettings: UITableViewController {
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBAction func darkModeToggle(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "DarkModeState")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        dismissKeyboard()
        toggleDarkMode()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 2 && indexPath.row == 1) {
            let phoneNumber = "1234567890"
            if let url = URL(string: "tel://\(phoneNumber)"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        if(indexPath.section == 3) {
            signOut()
        }
        
        if(indexPath.section == 4){
            deleteAccount()
        }
        
    }
    
    func signOut(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    func toggleDarkMode(){
        let isOn = UserDefaults.standard.bool(forKey: "DarkModeState")
        switchOutlet.isOn = isOn
        
        // Apply the saved interface style
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = isOn ? .dark : .light
            }
        }
    }
}
