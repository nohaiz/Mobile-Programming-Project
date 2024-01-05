//
//  FacilityTableViewCell.swift
//  Mobile Programming Project
//
//  Created by Mohamed Hasan Alaam on 28/12/2023.
//

import Foundation
import UIKit

class FacilityTableViewCell: UITableViewCell {

    @IBOutlet weak var facilityNameLbl: UILabel!
    @IBOutlet weak var facilityTypeLbl: UILabel!
    @IBOutlet weak var facilityLocationLbl: UILabel!
    
    func configure(facility: Facility){
        facilityNameLbl.text = facility.name
        facilityLocationLbl.text = facility.location
        if (facility.facilityType == .hospital)
        {facilityTypeLbl.text = "Hospital"}
        else
        {facilityTypeLbl.text = "Lab"}
    }
    
    
}
