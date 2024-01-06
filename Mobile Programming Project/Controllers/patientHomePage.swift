//
//  ViewController.swift
//  Project
//
//  Created by  User on 09.12.2023.
//

import UIKit

class patientHomePage: UIViewController{
    
    // Variable to hold the user data
       var user: PatientUser?
       // Array to hold the services included in the view
       var includedServices: [Services] = []
       // Enum to hold the filter type
       var currentFilter = FilterType.promoted

       // Enum to represent the filter types
       enum FilterType {
        case promoted
        case new
        case mostPopular
       }

       // Initializer to initialize the view controller with a user
       init(user: PatientUser?) {
          self.user = user
          super.init(nibName: nil, bundle: nil)
       }
       
       // Initializer to initialize the view controller with a user and services
       init(user: PatientUser?, services: [Services]?) {
          self.user = user
          self.includedServices = services!
          super.init(nibName: nil, bundle: nil)
       }
       
       // Required initializer for Storyboards
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the specific user from AppData
          if let matchedPatientUser = AppData.sampleDataPatient.first(where: { $0.email == "janesmith@hotmail.com" && $0.password == "fhtidnj3" }) {
             self.user = matchedPatientUser
          }

        // Set the corner radius of the upcomingLabView
               upcomingLabView.layer.cornerRadius = 12
               // Set the delegate and datasource of the tableView
               tableView.delegate = self
               tableView.dataSource = self
               // Add sample services to AppData
               AppData.addSampleServices()
               // Assign the patient services from AppData to includedServices
               includedServices = AppData.patientServices
               // Set the user name
               setUserName()
               // Call the segmentChanged function with the segmentedFilter
               segmentChanged(segmentedFilter)
               // Update the upcoming lab details
               updateUpcomingLabDetails()
        
    }
    
    @IBOutlet weak var upcomingName: UILabel!
    @IBOutlet weak var upcomingDate: UILabel!
    @IBOutlet weak var upcomingLabName: UILabel!
    @IBOutlet weak var segmentedFilter: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var upcomingLabView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func unwindToTabBarCon(segue: UIStoryboardSegue){
        
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
         case 0:
             currentFilter = .promoted
         case 1:
             currentFilter = .new
         case 2:
             currentFilter = .mostPopular
         default:
             break
         }
         tableView.reloadData()
        
    }
    
}

extension patientHomePage: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "ShowLabDetails", sender: self)
    }
}

extension patientHomePage: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var filteredServices: [Services]
        switch currentFilter {
        case .promoted:
            filteredServices = includedServices.filter { $0.isPromoted }
        case .new:
            filteredServices = includedServices.filter { $0.isRecent }
        case .mostPopular:
            filteredServices = includedServices.sorted { $0.popularityScore > $1.popularityScore }
        }
        return filteredServices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
       var filteredServices: [Services]
       switch currentFilter {
       case .promoted:
           filteredServices = includedServices.filter { $0.isPromoted }
       case .new:
           filteredServices = includedServices.filter { $0.isRecent }
       case .mostPopular:
           filteredServices = includedServices.sorted { $0.popularityScore > $1.popularityScore }
       }
       let service = filteredServices[indexPath.row]
       cell.textLabel?.text = service.name
       cell.detailTextLabel?.text = service.description
       return cell
    }

        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Check the Dark Mode state and apply it
            let isOn = UserDefaults.standard.bool(forKey: "DarkModeState")
            // Apply the saved interface style
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = isOn ? .dark : .light
                }
            }
            tableView.reloadData()
        }
        
        func setUserName(){
            print("Setting user name to: \(user?.fullname ?? "No user")")
            userNameLabel.text = user?.fullname
        }
    
    func updateUpcomingLabDetails() {
     guard !includedServices.isEmpty else {
         // Handle the case where there are no services
         upcomingName.text = "No Upcoming Lab"
         upcomingDate.text = ""
         upcomingLabName.text = ""
         return
     }

     // Get the latest service
     let latestService = includedServices.max(by: { $0.date < $1.date })

     // Format the date
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "yyyy/MM/dd"
     let dateString = dateFormatter.string(from: latestService!.date)

     // Update the labels with the latest service details
     upcomingName.text = latestService?.name
     upcomingDate.text = dateString
     upcomingLabName.text = latestService?.hospitalName
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "ShowLabDetails",
          let destinationVC = segue.destination as? LabDetailsViewController,
          let selectedIndexPath = tableView.indexPathForSelectedRow {
           let selectedService = includedServices[selectedIndexPath.row]
           destinationVC.service = selectedService
       }
        if segue.identifier == "ShowSettings",
             let destinationVC = segue.destination as? patientSettings {
              destinationVC.user = self.user
          }
        
    }
    


        
    }
    
    
