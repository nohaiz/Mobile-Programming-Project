//
//  ServiceTableViewCell.swift
//  Mobile Programming Project
//
//  Created by Hadi Jaffer on 25/12/2023.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var serviceType: UILabel!
    
    func configure(service: Service){
        serviceName.text = service.name
        servicePrice.text = "Price: "+String(service.price)+" BHD"
        
        if service is Package {
            serviceType.text = "Type: Package"
        }
        else{
            serviceType.text = "Type: Test"
        }
    }
    
}
