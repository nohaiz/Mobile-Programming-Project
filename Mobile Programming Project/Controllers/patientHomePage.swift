//
//  ViewController.swift
//  Project
//
//  Created by  User on 09.12.2023.
//

import UIKit

class patientHomePage: UIViewController{
    
    var user: PatientUser?
    var includedServices: [Service] = []
    
    init(user: PatientUser?) {
       self.user = user
       super.init(nibName: nil, bundle: nil)
    }
    
    init(user: PatientUser?, services: [Service]?) {
       self.user = user
        self.includedServices = services!
       super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingLabView.layer.cornerRadius = 12
        tableView.delegate = self
        tableView.dataSource = self
        setUserName()
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var upcomingLabView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func unwindToTabBarCon(segue: UIStoryboardSegue){
        
    }
    
    
}

extension patientHomePage: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}

extension patientHomePage: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return includedServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        let service = includedServices[indexPath.row]
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
    }
    
    func setUserName(){
        print("Setting user name to: \(user?.fullname ?? "No user")")
        userNameLabel.text = user?.fullname
    }

}
