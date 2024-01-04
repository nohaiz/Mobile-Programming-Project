//
//  BookingHistoryViewController.swift
//  Booking
//
//  Created by mobileProg on 12/12/2023.
//

import UIKit

class BookingHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
 

    @IBOutlet weak var historySeg: UISegmentedControl!
    
    
    @IBOutlet weak var historyTable: UITableView!

    @IBAction func segChange(_ sender: Any) {
        let selectedSegment = historySeg.selectedSegmentIndex

          switch selectedSegment {
          case 0:
              filteredData = data.filter { $0.status == "Pending" }
          case 1:
              filteredData = data.filter { $0.status == "Completed" }
          case 2:
              filteredData = data.filter { $0.status == "Cancelled" }
          default:
              break
          }

        historyTable.reloadData()
        
    }
    
    
   
       
       // Add more bookings as needed
    var data = BookingHistory.sampleData
     var filteredData: [BookingHistory] = []

    override func viewDidLoad() {
       super.viewDidLoad()
        
      
        //UserDefaults.standard.removeObject(forKey: "Bookings")
        





        
       _ = historySeg.selectedSegmentIndex

       historyTable.dataSource = self
       historyTable.delegate = self

       historySeg.addTarget(self, action: #selector(segChange), for: .valueChanged)

        if let savedBookings = UserDefaults.standard.object(forKey: "Booking") as? Data {
             let decoder = JSONDecoder()
             if let loadedBookings = try? decoder.decode([BookingHistory].self, from: savedBookings) {
                BookingHistory.sampleData = loadedBookings
             }
          }

       segChange((Any).self)
      

       // Do any additional setup after loading the view.
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           // Get the booking
           let booking = filteredData[indexPath.row]

           // Check if the booking is pending
           if booking.status == "Pending" {
               // Change the status of the booking to "Cancelled"
               booking.status = "Cancelled"

               // Update your data source
               if let index = data.firstIndex(where: { $0.id == booking.id }) {
                   data[index].status = "Cancelled"
               }

               // Save your data array to UserDefaults
               let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(data) {
                   UserDefaults.standard.set(encoded, forKey: "Booking")
               }
           } else {
               // Remove the booking from your data source
               data.removeAll(where: { $0.id == booking.id })
               filteredData.removeAll(where: { $0.id == booking.id })

               // Delete the row from the table view
               tableView.deleteRows(at: [indexPath], with: .fade)

               // Save your data array to UserDefaults
               let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(data) {
                   UserDefaults.standard.set(encoded, forKey: "Booking")
               }
           }

           // Call segChange(_:) to update the state of the table view
           segChange((Any).self)
       }
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action, view, completionHandler) in
          // Get the booking
          let booking = self.filteredData[indexPath.row]

          // Check if the booking is pending
          if booking.status == "Pending" {
              // Change the status of the booking to "Completed"
              booking.status = "Completed"

              // Update your data source
              if let index = self.data.firstIndex(where: { $0.id == booking.id }) {
                  self.data[index].status = "Completed"
              }

              // Save your data array to UserDefaults
              let encoder = JSONEncoder()
              if let encoded = try? encoder.encode(self.data) {
                  UserDefaults.standard.set(encoded, forKey: "Booking")
              }
              
              completionHandler(true)

              // Call segChange(_:) to update the state of the table view
              self.segChange((Any).self)
          }
      }
      
      completeAction.backgroundColor = .systemGreen
      
      let configuration = UISwipeActionsConfiguration(actions: [completeAction])
      
      return configuration
    }


    



  





    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingHistoryTableViewCell

        let booking = filteredData[indexPath.row]
        cell.status = booking.status
        cell.bookingStatusLbl.text = booking.status
        cell.hospitalName.text = booking.hospitalName
        cell.testName.text = booking.testName
        cell.testDate.text = booking.testDate

        return cell
    }
 }




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


