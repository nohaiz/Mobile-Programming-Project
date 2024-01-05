//
//  FacilityTableViewController.swift
//  Mobile Programming Project
//
//  Created by Mohamed Hasan Alaam on 27/12/2023.
//

import Foundation
import UIKit

class FacilityTableViewController: UITableViewController, UISearchBarDelegate{
    var facilities: [Facility] = AppData.facilities
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = stackView
        searchBar.delegate = self
        searchBar.placeholder = "Search facilities"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Log out", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    @objc func logoutButtonTapped() {
        goToStoryboard(storyboardName: "Main", identifier: "mainNav")

        // Assuming you want to pop back to the previous storyboard
        self.navigationController?.popViewController(animated: true)
    }
    
    func filterFacilities() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            facilities = AppData.facilities
        case 1:
            facilities = AppData.facilities.filter { $0.facilityType == .hospital }
        case 2:
            
            facilities = AppData.facilities.filter { $0.facilityType == .lab }
        default:
            break
        }
        tableView.reloadData()
    }
    
    @IBAction func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        filterFacilities()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            facilities = AppData.facilities.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            segmentedControl.isHidden = true
        } else {
            facilities = AppData.facilities
            segmentedControl.isHidden = false
            segmentedControl.selectedSegmentIndex = 0
        }
        
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return facilities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.FacilityCell.rawValue, for: indexPath) as! FacilityTableViewCell
        let facility = facilities[indexPath.row]
        cell.configure(facility: facility)
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            confirmation(title: "Delete Confirmation", message: "Are you sure you want to delete this facility?") {[self] in
                let facility = facilities[indexPath.row]
                AppData.deleteFacility(facility: facility)
                facilities.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    @IBSegueAction func editFacility(_ coder: NSCoder, sender: Any?) -> FacilityFormTableViewController?{
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return nil }
        
        let facility = facilities[indexPath.row]
        return FacilityFormTableViewController(coder: coder, facility: facility)
    }
    
    @IBAction func unwindToFacilities(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? FacilityFormTableViewController,
              let facility = source.facility else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let Filteredfacility = facilities[indexPath.row]
            facility.id = Filteredfacility.id
            AppData.editFacility(facility: facility)
            facilities.remove(at: indexPath.row)
            facilities.insert(facility, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            AppData.addFacility(facility: facility)
            filterFacilities()
        }
        filterFacilities()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Hide search
        tableView.reloadData()
    }
}
