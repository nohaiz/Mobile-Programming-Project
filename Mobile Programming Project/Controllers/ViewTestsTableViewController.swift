//
//  ViewTestsTableViewController.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 26/12/2023.
//

import UIKit

class ViewTestsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBtnClicked))
        tableView.reloadData()
    }
        
        var includedTests: [Test] = []
        var tests: [Test]?
        init?(coder: NSCoder, includedTests: [Test]) {
        self.includedTests = includedTests
        self.tests = includedTests
            super.init(coder: coder)
        }
        
        required init?(coder: NSCoder) {
            self.includedTests = []
            self.tests = []
            super.init(coder: coder)
        }
        
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return includedTests.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ViewTestCell.rawValue, for: indexPath)
            
            let test = includedTests[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = test.name
            cell.contentConfiguration = content
            
            return cell
        }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteAlert(title: "Delete?", message: "Are you sure you want to delete this test from the package?") {[self] in
                includedTests.remove(at: indexPath.row)
                tests?.remove(at: indexPath.row)
                tableView.deleteRows(at:[indexPath], with: .fade)
            }
        }
    }
    
    @objc func backBtnClicked(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: SegueId.unwindToServiceForm.rawValue, sender: sender)
        }
    }

