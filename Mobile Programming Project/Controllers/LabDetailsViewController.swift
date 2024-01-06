//
//  LabDetailsViewController.swift
//  Mobile Programming Project
//
//  Created by Ali Alfardan on 07/01/2024.
//

import UIKit

class LabDetailsViewController: UIViewController {
   var service: Services?

   @IBOutlet weak var serviceNameLabel: UILabel!
   @IBOutlet weak var serviceDescriptionLabel: UILabel!
   @IBOutlet weak var servicePriceLabel: UILabel!
   @IBOutlet weak var serviceHospitalNameLabel: UILabel!

    
   override func viewDidLoad() {
       super.viewDidLoad()

       // Set the navigation title to the name of the lab
       navigationItem.title = service?.name

       // Update the labels with the service details
       serviceNameLabel.text = service?.name
       serviceDescriptionLabel.text = service?.description
       servicePriceLabel.text = "\(service?.price ?? 0.0)"
       serviceHospitalNameLabel.text = service?.hospitalName
   }
}
