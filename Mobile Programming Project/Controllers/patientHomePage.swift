//
//  ViewController.swift
//  Project
//
//  Created by  User on 09.12.2023.
//

import UIKit

class patientHomePage: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingLabView.layer.cornerRadius = 12
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var upcomingLabView: UIView!
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = "Lab Name"
        cell.detailTextLabel?.text = "Hosiptal Name"
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

}
