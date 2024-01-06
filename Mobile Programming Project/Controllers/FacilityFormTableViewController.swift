//
//  FacilityFormTableViewController.swift
//  Facilitiess
//
//  Created by Mohamed Hasan Alaam on 27/12/2023.
//

import Foundation
import UIKit
//import FirebaseStorage
//import FirebaseFirestore

class FacilityFormTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var facilitySC: UISegmentedControl!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var locationTxtFld: UITextField!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var isAvailableSwitch: UISwitch!
    @IBOutlet weak var isOpenSwitch: UISwitch!
    @IBOutlet weak var fromTimePicker: UIDatePicker!
    @IBOutlet weak var toTimePicker: UIDatePicker!
    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var facility: Facility?
    let facilityType: FacilityType = .hospital
    var logo: UIImage? = UIImage(named: "addLogo")
    var name: String = ""
    var location: String = ""
    var phone:String = ""
    var username:String = ""
    var password:String = ""
    var from: Date? = nil
    var to: Date? = nil
    var changesMade = false;
//    var retrievedImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpenSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(discardChanges))
        updateViews()
//        retrievePhoto()
    }
    
    init?(coder: NSCoder, facility: Facility?) {
        self.facility = facility
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.facility = nil
        super.init(coder: coder)
    }
    
    @IBAction func importImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {return}
        logoImageView.image = image
        
//        if logoImageView.image != UIImage(named: "addLogo")
//        {
//            uploadPhoto()
//        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
//    func uploadPhoto() {
//        guard logoImageView.image != UIImage(named: "addLogo") else {
//            return
//        }
//
//        let storageRef = Storage.storage().reference()
//
//        let imageData = logoImageView.image!.pngData()
//
//        guard imageData != nil else {return}
//
//        let path = "images/\(UUID().uuidString).png"
//        let fileRef = storageRef.child(path)
//
//        let upload = fileRef.putData(imageData!) { metadata, error in
//            if  metadata != nil && error == nil {
//                let db = Firestore.firestore()
//                db.collection ("images").document().setData(["url":path]) { error in
//                    if error == nil {
//                        DispatchQueue.main.async {
//                            self.retrievedImages.append(self.logoImageView.image!)
//                        }
//                    }
//                }
//            }
//        }
//    }
    
//    func retrievePhoto() {
//        let db = Firestore.firestore()
//        var paths = [String]()
//
//        db.collection("images").getDocuments { snapshot, error in
//            if snapshot != nil && error == nil {
//                for doc in snapshot!.documents {
//                    paths.append(doc["url"] as! String)
//                }
//                for path in paths {
//                    let storageRef = Storage.storage().reference()
//                    let fileRef = storageRef.child(path)
//                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
//                        if data != nil && error == nil{
//                            if let image = UIImage(data: data!) {
//                                DispatchQueue.main.async {
//                                    self.retrievedImages.append(image)
//                                }
//                                self.facility?.logoData = data!
//                                self.logoImageView.image = UIImage(data: data!)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    @objc func switchValueChanged() {
        let isAlwaysOpen = isOpenSwitch.isOn
        fromTimePicker.isHidden = isAlwaysOpen
        toTimePicker.isHidden = isAlwaysOpen
    }
    
    
    func updateViews(){
        
        guard let facility = facility else{
            title = "Add Facility"
            logoImageView.image = UIImage(named: "addLogo")
            isAvailableSwitch.isOn = true
            isOpenSwitch.isOn = false
            fromTimePicker.date = Calendar.current.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!
            toTimePicker.date = Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!
            facilitySC.selectedSegmentIndex = 0
            saveButton.isEnabled = false;
            return
        }
        
        title = "Edit Facility"
        logoImageView.image = UIImage(data: facility.logoData as Data)
        nameTxtFld.text = facility.name
        locationTxtFld.text = facility.location
        passwordTxtFld.text = facility.password
        usernameTxtFld.text = facility.username
        phoneNumberTxtFld.text = facility.contactNumber
        
        if !facility.isAvailable
        {
            isAvailableSwitch.isOn = false
        }
        else
        {
            isAvailableSwitch.isOn = true
        }
        
        if !facility.isAlwaysOpen
        {
            isOpenSwitch.isOn = false
            fromTimePicker.date = facility.startTime!
            toTimePicker.date = facility.endTime!
        }
        else
        {
            isOpenSwitch.isOn = true
            fromTimePicker.isHidden = true
            toTimePicker.isHidden = true
        }
        
        
        if facility.facilityType == .hospital {facilitySC.selectedSegmentIndex = 0}
        else
        {facilitySC.selectedSegmentIndex = 1}
        
    }
    
    
    @IBAction func editingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    
    func updateSaveButtonState() {
        
        logo = logoImageView.image ?? UIImage(named: "addLogo")
        name = nameTxtFld.text ?? ""
        username = usernameTxtFld.text ?? ""
        password = passwordTxtFld.text ?? ""
        location = locationTxtFld.text ?? ""
        phone = phoneNumberTxtFld.text ?? ""
        changesMade = true;
        
        saveButton.isEnabled = !name.isEmpty && !username.isEmpty && !password.isEmpty && !location.isEmpty && !phone.isEmpty
        
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        
        if changesMade{
            confirmation(title: "Save changes", message: "Are you sure you want to save your changes?") {
                self.saveFacility(sender)
            }
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @objc func discardChanges() {
            if changesMade {
                discardConfirmation(title: "Discard Changes", message: "Are you sure you want to discard your changes?") { [self] in
                    changesMade = false
                    navigationController?.popViewController(animated: true)
                }
            } else {
                navigationController?.popViewController(animated: true)
        }
    }
        
    func saveFacility(_ sender: UIBarButtonItem){
        guard !name.isEmpty, !phone.isEmpty,!location.isEmpty,!username.isEmpty,!password.isEmpty else {return}
            
            if !isOpenSwitch.isOn {
                from = fromTimePicker.date
                to = toTimePicker.date
            }
            
            if let logo = logoImageView.image {
                if facilitySC.selectedSegmentIndex == 0 {
                    facility = Facility(facilityType: .hospital, logo: logo, name: name, contactNumber: phone, location: location, isAvailable: isAvailableSwitch.isOn, isAlwaysOpen: isOpenSwitch.isOn,startTime: from,endTime: to, username: username, password: password)
                }else{
                    facility = Facility(facilityType: .lab, logo: logo, name: name, contactNumber: phone, location: location, isAvailable: isAvailableSwitch.isOn, isAlwaysOpen: isOpenSwitch.isOn,startTime: from,endTime: to, username: username, password: password)
                }
            }else {
                
            }
            
            performSegue(withIdentifier: SegueId.unwindToFacilities.rawValue, sender: sender)
        }
    
}
