//
//  patientSettings.swift
//  Mobile Programming Project
//
//  Created by Ali Alfardan on 18/12/2023.
//

import UIKit

class patientSettings: UITableViewController {
    
    var user: PatientUser?
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cprTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
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
        
        //setting the text boxs to the users data
        fullNameTextField.text = user?.fullname
          cprTextField.text = user?.cpr
          emailTextField.text = user?.email
          passwordTextField.text = user?.password
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
    
    func textFieldShouldEndEditing(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
        let finalString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
           
           switch textField {
           case fullNameTextField:
               user?.fullname = finalString!
           case cprTextField:
               user?.cpr = finalString!
           case emailTextField:
               user?.email = finalString!
           case passwordTextField:
               user?.password = finalString!
           default:
               break
           }
          return true
      }

    func isValidCPR(_ cpr: String) -> Bool {
      let cprRegex = "^\\d{9}$"
      let cprTest = NSPredicate(format: "SELF MATCHES %@", cprRegex)
      return cprTest.evaluate(with: cpr)
    }

    func isValidEmail(_ email: String) -> Bool {
      let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
      return emailTest.evaluate(with: email)
    }

    func showAlert(title: String, message: String) {
       let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
       alertController.addAction(UIAlertAction(title: "OK", style: .default))
       self.present(alertController, animated: true, completion: nil)
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
