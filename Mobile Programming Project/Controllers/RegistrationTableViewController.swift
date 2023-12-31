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
        dismissKeyboard()
        genderBtn.menu = genderItems()
        
        // Set up the date picker
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        datepicker.frame.size = CGSize(width: 0, height: 300)
        datepicker.preferredDatePickerStyle = .wheels
        
        // Set up the toolbar for the date picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        
        // Set the input view and input accessory view for the date of birth text field
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
        let maleAction = UIAction(title: "Male", handler: { [weak self] (_) in
            self?.gender = "Male"
            self?.genderBtn.setTitle("Male", for: .normal)
        })
        
        let femaleAction = UIAction(title: "Female", handler: { [weak self] (_) in
            self?.gender = "Female"
            self?.genderBtn.setTitle("Female", for: .normal)
        })
        
        let genderMenu = UIMenu(title: "", children: [maleAction, femaleAction])
        
        return genderMenu
    }
    
    @IBAction func editingChnaged(_ sender: UITextField) {
        updateSaveBtnState() 
    }
    
    @IBAction func SavedBtn() {
        
        // Validate the input fields and save the data
        if let fullName = fullnameTextfield.text, !fullName.isEmpty, fullName.rangeOfCharacter(from: CharacterSet.letters) != nil {
            
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
                        // Create new patient object and save to sample data
                        let newPatient = PatientUser(fullname: name, cpr: cpr, email: username, password: password, gender: gender, date: dob)
                        AppData.sampleDataPatient.append(newPatient)
                        AppData.saveToFile()
                        // Perform segue to login page
                        goToStoryboard(storyboardName: "Main", identifier: "mainNav")
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
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
