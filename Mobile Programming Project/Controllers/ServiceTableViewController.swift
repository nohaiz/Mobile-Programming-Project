//
//  ServiceTableViewController.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 25/12/2023.
//

import UIKit

class ServiceTableViewController: UITableViewController, UISearchBarDelegate {
    
    var services: [Service] = AppData.services
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = stackView
        searchBar.delegate = self
        searchBar.placeholder = "Search services"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Log out", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    @objc func logoutButtonTapped() {
        goToStoryboard(storyboardName: "Main", identifier: "mainNav")

        // Assuming you want to pop back to the previous storyboard
        self.navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ServiceCell.rawValue, for: indexPath) as! ServiceTableViewCell
        let service = services[indexPath.row]
        cell.configure(service: service)
        return cell
    }
    
    @IBAction func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        filterServices()
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteAlert(title: "Delete service?", message: "Are you sure you want to delete this service") {[self] in
                let service = services[indexPath.row]
                AppData.deleteService(service: service)
                services.remove(at: indexPath.row)
                tableView.deleteRows(at:[indexPath], with: .fade)
            }
        }
    }
    
    @IBSegueAction func editService(_ coder: NSCoder, sender: Any?) -> ServiceFormTableViewController?{
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return nil }
        
        let service = services[indexPath.row]
        return ServiceFormTableViewController(coder: coder, service: service)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            services = AppData.services.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            segmentedControl.isHidden = true
        } else {
            services = AppData.services
            segmentedControl.isHidden = false
            segmentedControl.selectedSegmentIndex = 0
        }

        tableView.reloadData()
    }
    
    func filterServices(){
        let selectedIndex = segmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            services = AppData.services
        case 1:
            services = AppData.services.compactMap{$0 as? Package}
        case 2:
            services = AppData.services.compactMap{$0 as? Test}
        default:
            break;
        }
        tableView.reloadData()
    }
    
    @IBAction func unwindToServices(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? ServiceFormTableViewController,
              let service = source.service else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedService = services[indexPath.row]
            service.id = selectedService.id
            AppData.editService(service: service)
            services.remove(at: indexPath.row)
            services.insert(service, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            
        } else {
            AppData.addService(service: service)
        }
        filterServices()
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

    }
}
