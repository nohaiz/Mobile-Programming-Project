//
//  BookingTableViewController.swift
//  Booking
//
//  Created by mobileProg on 25/12/2023.
//

import UIKit

class BookingTableViewController: UITableViewController {
    
    
    @IBOutlet weak var pTNameLbl: UILabel!
    
    
    @IBOutlet weak var hospNameLbl: UILabel!
    
    
    @IBOutlet weak var bookingDate: UIDatePicker!
    
    
    
    @IBOutlet weak var bookingPriceLbl: UILabel!
    
    
   
    @IBOutlet weak var bookingDescLbl: UILabel!
    

    @IBOutlet weak var fastingPeriodLbl: UILabel!
    
    
    @IBOutlet weak var testListLbl: UILabel!
    
    
    @IBOutlet weak var expirationDate: UIDatePicker!
    
    @IBOutlet weak var bookBtn: UIBarButtonItem!
    
    
    @IBAction func bookBtnClicked(_ sender: Any) {
   
    
        let alertController = UIAlertController(title: "Confirm Booking", message: "Are you sure you want to confirm this booking?", preferredStyle: .alert)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // Specify the format you want
        let dateString = dateFormatter.string(from: bookingDate.date)
        
        
         let okAction = UIAlertAction(title: "Yes", style: .default) { _ in
             let bookingHistory = BookingHistory(status: "Pending", hospitalName: self.hospNameLbl.text!, testName: self.pTNameLbl.text!, testDate: dateString)
             
             BookingHistory.sampleData.append(bookingHistory)
             
             // Handle the booking here
             let encoder = JSONEncoder()
             if let encoded = try? encoder.encode(BookingHistory.sampleData) {
                    let defaults = UserDefaults.standard
                    defaults.set(encoded, forKey: "Booking")
                }
             
          
             
             if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "bH") as? BookingHistoryViewController {
               self.navigationController?.pushViewController(nextVC, animated: true)
             }
             // Navigate to the next page
             //self.performSegue(withIdentifier: "unwindToBook", sender: sender)
         }

         let cancelAction = UIAlertAction(title: "No", style: .cancel) { _ in
             // Handle the cancellation here
         }

         alertController.addAction(okAction)
         alertController.addAction(cancelAction)

         present(alertController, animated: true, completion: nil)
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expirationDate.isUserInteractionEnabled = false
        bookingDescLbl.text = "At the American Mission Hospital, a vitamin C test is a routine diagnostic procedure employed to assess the levels of vitamin C in a patient's blood. This test is crucial in determining an individual's nutritional status and can aid in identifying potential deficiencies or excesses of vitamin C. The hospital utilizes state-of-the-art laboratory equipment and follows rigorous protocols to ensure accurate and reliable results. The vitamin C test plays a pivotal role in maintaining overall health, as this essential nutrient is known for its antioxidant properties and its role in supporting the immune system. The American Mission Hospital prioritizes precision and efficiency in conducting such tests, contributing to comprehensive patient care and well-being."
        bookingDescLbl.contentMode = .top
        hospNameLbl.text = "American Mission Hospital"
        pTNameLbl.text = "Vitamn C Test"
        fastingPeriodLbl.text = "0"
        bookingPriceLbl.text = "12 BHD"


        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    } */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
