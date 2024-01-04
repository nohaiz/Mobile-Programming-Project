//
//  BookingHistoryTableViewCell.swift
//  Booking
//
//  Created by mobileProg on 12/12/2023.
//

import UIKit

class BookingHistoryTableViewCell: UITableViewCell {
    
    
    
    
  
    @IBOutlet weak var bookingStatusLbl: UILabel!
    
    @IBOutlet weak var hospitalName: UILabel!
    
    
    @IBOutlet weak var testName: UILabel!
    
    
    @IBOutlet weak var testDate: UILabel!
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var status: String? {
        didSet {
            updateStatusColor()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateStatusColor()
        bookingStatusLbl.layer.cornerRadius = 10
        bookingStatusLbl.clipsToBounds = true
    }

    func updateStatusColor() {
        guard let status = status else {
            bookingStatusLbl.backgroundColor = UIColor.clear
            return
        }

        switch status {
        case "Cancelled":
            bookingStatusLbl.backgroundColor = UIColor.systemRed
        case "Pending":
            bookingStatusLbl.backgroundColor = UIColor.systemYellow
        case "Completed":
            bookingStatusLbl.backgroundColor = UIColor.systemGreen
        default:
            bookingStatusLbl.backgroundColor = UIColor.clear
        }
    }
 }


