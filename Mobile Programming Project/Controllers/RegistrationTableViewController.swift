//
//  RegistrationTableViewCell.swift
//  Mobile Programming Project
//
//  Created by Nohaiz on 14/12/2023.
//

import UIKit


class RegistrationTableViewController: UITableViewController {
    
    @IBOutlet weak var fullnameTextfield: UITextField!
    @IBOutlet weak var cprTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var DOBTextfield: UITextField!
    
    var name: String = ""
    var cpr: String = ""
    var username: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var gender: String = ""
    var dob: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveBtnState()
        genderBtn.menu = genderItems()
        
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        datepicker.frame.size = CGSize(width: 0, height: 300)
        datepicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        
        DOBTextfield.inputAccessoryView = toolbar
        DOBTextfield.inputView = datepicker
        DOBTextfield.text = formatDate(date: Date())
    }

    @objc func dateChange(datePicker: UIDatePicker) {
        DOBTextfield.text = formatDate(date: datePicker.date)
        dob = DOBTextfield.text ?? ""

    }

    @objc func doneButtonTapped() {
        DOBTextfield.resignFirstResponder()

    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }


    
    func genderItems() -> UIMenu {
        let maleAction = UIAction(title: "Male", handler: { (_) in
            self.gender = "Male"
        })
        
        let femaleAction = UIAction(title: "Female", handler: { (_) in
            self.gender = "Female"
        })
        
        let genderMenu = UIMenu(title: "", children: [maleAction, femaleAction])
        
        return genderMenu
    }
    
    @IBAction func editingChnaged(_ sender: UITextField) {
        updateSaveBtnState() 
    }
    
    @IBAction func SavedBtn() {
        
        if let _ = fullnameTextfield.text, fullnameTextfield.text?.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil {
            
            if let _ = Int(cprTextfield.text ?? ""), cprTextfield.text?.count == 9 {
                
                if isValidEmail(email: emailTextfield.text ?? "") {
                    
                    if passwordTextfield.text != confirmPasswordTextfield.text{
                        displayMismatchPasswordsAlert()
                    }
                    else if (passwordTextfield.text ?? "").count < 8 && (confirmPasswordTextfield.text ?? "").count < 8 {
                        displayMismatchPasswordsAlert()
                    }
                    else if gender.isEmpty {
                        displayGenderNotSelectedAlert()
                    }
                    else if dob.isEmpty {
                        displayDOBNotSelectedAlert()
                    }
                    else {
                        let newPatient = PatientUser(fullname: name, cpr: cpr, email: username, password: password, gender: gender, date: dob)
                        AppData.sampleDataPatient.append(newPatient)
                        AppData.saveToFile()
                        performSegue(withIdentifier: "loginPage", sender: Any?.self)
                    }
                }
                else {
                    displayInvalidEmailAlert()
                }
            }
            else {
                displaysErrorIfNotInt()
            }
        }
        else {
            displayErrorName()
        }

    }
    
    func updateSaveBtnState() {
        name = fullnameTextfield.text ?? ""
        cpr = cprTextfield.text ?? ""
        username = emailTextfield.text ?? ""
        password = passwordTextfield.text ?? ""
        confirmPassword = confirmPasswordTextfield.text ?? ""

        saveBtn.isEnabled = !name.isEmpty && !cpr.isEmpty && !username.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
        
    }
}
