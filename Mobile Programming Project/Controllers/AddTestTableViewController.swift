//
//  AddTestTableViewController.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 26/12/2023.
//

import UIKit

class AddTestTableViewController: UITableViewController {

    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    var testList: [Test] = AppData.services.compactMap{ $0 as? Test }
    var includedTests: [Test] = []
    var test: Test? = nil {
        didSet {
            doneBtn.isEnabled = test != nil
        }
    }
    
    init?(coder: NSCoder, includedTests: [Test]) {
        self.includedTests = includedTests
        //delete tests that are already present in the package
        for test in self.includedTests
        {
            if let index = testList.firstIndex(where: { $0.id == test.id })
            {
                testList.remove(at: index)
            }
        
        }
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test = nil
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        guard test != nil else { return }
        confirmAction(title: "Add Test?", message: "Are you sure you want to add this test to the package?") {[self] in
          performSegue(withIdentifier: SegueId.unwindToServiceForm.rawValue, sender: sender)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.TestCell.rawValue, for: indexPath)
        
        let test = testList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = test.name
        cell.contentConfiguration = content
        cell.selectionStyle = .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        test = testList[indexPath.row]
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        test = nil
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
