//
//  ServiceFormTableViewController.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 25/12/2023.
//

import UIKit

class ServiceFormTableViewController: UITableViewController,UINavigationControllerDelegate {
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var serviceSC: UISegmentedControl!
    @IBOutlet weak var expiryDatePicker: UIDatePicker!
    @IBOutlet weak var isFastRequiredSwitch: UISwitch!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    
    var service: Service?
    var name: String = ""
    var price: Double = 0
    var serviceDescription: String = ""
    var expiryDate: Date = Date.now
    var includedTests: [Test] = []
    var dataChanged = false;
    
    //variables to detect changes
    var initalName = ""
    var initalPrice = 0.0
    var initalDescription = ""
    var initalDate = Date.now
    var initalReq = false
    var initalTests: [Test] = []
    var initalType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(discardChanges))
        userTypeChanged(serviceSC)
        expiryDatePicker.minimumDate = Date.now
        tableView.reloadData()
    }
    
    init?(coder: NSCoder,service: Service?){
        self.service = service
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.service = nil
        super.init(coder: coder)
    }
    
    func updateView(){
        guard let service = service else{
            title = "Add Service"
            saveBtn.isEnabled = false
            return
        }
        
        title = "Edit Service"
        nameTxt.text = service.name
        priceTxt.text = String(service.price)
        descriptionTxt.text = service.description
        isFastRequiredSwitch.isOn = service.isFastingRequried
        
        initalName = service.name
        initalPrice = service.price
        initalDescription = service.description
        initalReq = service.isFastingRequried
        
        if let package = service as? Package{
            expiryDatePicker.date = package.expiryDate
            includedTests = package.includedTests
            
            initalDate = package.expiryDate
            initalTests = package.includedTests
        }
        
        if service is Package{
            serviceSC.selectedSegmentIndex = 0
            initalType = 0
        }else{
            serviceSC.selectedSegmentIndex = 1
            initalType = 1
        }
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        name = nameTxt.text ?? ""
        serviceDescription = descriptionTxt.text ?? ""
        let priceText = priceTxt.text ?? ""
        price = Double(priceText) ?? 0.0
        expiryDate = expiryDatePicker.date
 
        dataChanged = detectChanges()
        
        saveBtn.isEnabled = !name.isEmpty && !serviceDescription.isEmpty && !price.isZero
    }
    
    func detectChanges() -> Bool{
        return name != initalName || serviceDescription != initalDescription || price != initalPrice || expiryDate != initalDate || initalType != serviceSC.selectedSegmentIndex
    }
    
    @IBAction func userTypeChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    //Hide package header if segment control on test
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Change package section title header based on segmented control
        if section == 2 {
            switch serviceSC.selectedSegmentIndex {
            case 0:
                return "Package Information"
            default:
                return nil
            }
        }
        return super.tableView(tableView, titleForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 && serviceSC.selectedSegmentIndex != 0 {
            return 0
        }
        
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    
    @IBAction func saveBtnClicked(_ sender: UIBarButtonItem) {
        
        if serviceSC.selectedSegmentIndex == 0 && includedTests.isEmpty{
            selectTestAlert()
        }
        
        if dataChanged{
            confirmAction(title: "Save changes", message: "Are you sure you want to save your changes?") {
                self.saveService(sender)
            }
        }else{
            performSegue(withIdentifier: SegueId.unwindToServices.rawValue, sender: sender)
        }
    }
    
    @objc func discardChanges(_ sender: UIBarButtonItem) {
            if dataChanged{
                discardAlert(title: "Discard Changes", message: "Are you sure you want to discard your changes?") { [self] in
                    performSegue(withIdentifier: SegueId.unwindToServices.rawValue, sender: sender)
                }
            } else {
                performSegue(withIdentifier: SegueId.unwindToServices.rawValue, sender: sender)
            }
    }
    
    
        
    func saveService(_ sender: UIBarButtonItem){

        if serviceSC.selectedSegmentIndex == 0{
            service = Package(name: name, price: price, description: serviceDescription, isFastingRequired: isFastRequiredSwitch.isOn, expiryDate: expiryDate, includedTests: includedTests)
        }else{
            service = Test(name: name, price: price, description: serviceDescription, isFastingRequired: isFastRequiredSwitch.isOn)
        }
        
        performSegue(withIdentifier: SegueId.unwindToServices.rawValue, sender: sender)
    }
    
    
    @IBSegueAction func viewIncludedTestSegue(_ coder: NSCoder,sender: Any?) -> ViewTestsTableViewController? {
        return ViewTestsTableViewController(coder: coder, includedTests: includedTests)
    }
    
    @IBSegueAction func addTestSegue(_ coder: NSCoder,sender: Any?) -> UITableViewController? {
        return AddTestTableViewController(coder: coder, includedTests: includedTests)
    }
    
//    @IBAction func unwindToServiceForm(unwindSegue: UIStoryboardSegue){
//        guard let source = unwindSegue.source as? AddTestTableViewController,
//              let test = source.test else { return}
//            includedTests.append(test)
//            dataChanged = true
//    }
    
    @IBAction func unwindToServiceForm(unwindSegue: UIStoryboardSegue) {
        if let source = unwindSegue.source as? AddTestTableViewController {
            if let test = source.test {
                updateSaveButtonState()
                includedTests.append(test)
                dataChanged = true
            }
        } else if let source = unwindSegue.source as? ViewTestsTableViewController {
            if let tests = source.tests{
                if tests.count != includedTests.count
                {
                    updateSaveButtonState()
                    includedTests = tests
                    dataChanged = true
                }
            }
        }
    }
}
