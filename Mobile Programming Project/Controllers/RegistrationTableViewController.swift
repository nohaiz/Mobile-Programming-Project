import UIKit

class RegistrationTableViewController: UITableViewController {
    
    @IBOutlet weak var fullnameTextfield: UITextField!
    @IBOutlet weak var cprTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var user: PatientUser?
    
    var username: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var name: String = ""
    var cpr: String = ""
    var gender: String = ""
    var dob: Date = Date()
    
    init?(coder: NSCoder, user: PatientUser?) {
        self.user = user
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.user = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveBtnState()
    }
    @IBAction func editingChanged(_ sender: Any) {
        updateSaveBtnState()
    }
    
    @IBAction func SavedBtn() {
        /*user = PatientUser(username: username, password: password, name: name, cpr: cpr, gender: gender, DOB: dob)
        print(user)*/
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
