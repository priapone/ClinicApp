//
//  ReminderVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class ReminderVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UNUserNotificationCenterDelegate {
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "ReminderViewCell", bundle: nil), forCellReuseIdentifier: "ReminderViewCell")
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
        }
    }
    
    var imageForMedicine = ["10","13","14","Rectangle 84","15","10"]
    var timeForReminder = ["8 PM","2 PM","3 PM","7 PM","8 PM","9 PM"]
    var medicines = [Medicine()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - navigation lbl
        print("Medicines in ReminderVC: \(medicines)")
        navigationView.TitleLebal.text = "Reminder"
        navigationView.TitleLebal.textColor = .Mycolor()
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - tableview Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return imageForMedicine.count
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminderCell = self.tableView.dequeueReusableCell(withIdentifier: "ReminderViewCell", for: indexPath) as! ReminderViewCell
        let medicine = medicines[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        reminderCell.lblMedicineName.text = medicine.name
        reminderCell.lblQuantity.text = "\(medicine.repetitions) capsula al giorno"
        reminderCell.lblTime.text = dateFormatter.string(from: medicine.start)
        reminderCell.ImageForMedicine.image = UIImage(named: medicine.image)
        let date = medicine.start
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        scheduleLocalNotification(hour: hour, minute: minute, name: medicine.name, start: medicine.start, end: medicine.end)
        return reminderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reminderCell = self.tableView.cellForRow(at: indexPath) as! ReminderViewCell
        reminderCell.myView.layer.borderColor = UIColor.Mycolor().cgColor
        reminderCell.myView.layer.borderWidth = 1.0
        reminderCell.vectorBtn.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let reminderCell = self.tableView.cellForRow(at: indexPath) as! ReminderViewCell
        reminderCell.myView.dropShadow()
        reminderCell.vectorBtn.isHidden = true
    }

    //MARK: - tableview header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleWithBtnTBVHeaderView") as! TitleWithBtnTBVHeaderView
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "dd/MM/YY"
        // Convert Date to String
        headerView.lblTitle.text = dateFormatter.string(from: Date())
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.00
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    
    //MARK: - plusbtn action
    
    @IBAction func plusBTnAction(_ sender: UIButton) {
        let vc = AddPillsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func registerCategories() {
//        let center = UNUserNotificationCenter.current()
//        center.delegate = self
//
//        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
//        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
//
//        center.setNotificationCategories([category])
//    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        // pull out the buried userInfo dictionary
//        let userInfo = response.notification.request.content.userInfo
//
//        if let customData = userInfo["customData"] as? String {
//            print("Custom data received: \(customData)")
//
//            switch response.actionIdentifier {
//            case UNNotificationDefaultActionIdentifier:
//                // the user swiped to unlock
//                print("Default identifier")
//
//            case "show":
//                // the user tapped our "show more info…" button
//                print("Show more information…")
//
//            default:
//                break
//            }
//        }
//
//        // you must call the completion handler when you're done
//        completionHandler()
//    }
    
    func scheduleLocalNotification(hour: Int, minute: Int, name: String, start: Date, end: Date) {
      //checking the notification setting whether it's authorized or not to send a request.
        print("Ora \(hour), minuto \(minute), \(name)")
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                let identifier = UUID().uuidString
                UserDefaults.standard.set(identifier, forKey: name)
              //1. create contents
                let content = UNMutableNotificationContent()
                    content.title = name
                    content.body = "Una pastiglia alle ore \(hour)"
                    content.sound = UNNotificationSound.default
                //2. create trigger [calendar, timeinterval, location, pushnoti]
                var dateComponents = DateComponents()
                    dateComponents.hour = hour
                    dateComponents.minute = minute
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                //3. make a request
                let request = UNNotificationRequest(identifier: name, content: content, trigger: trigger)
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.add(request) { (error) in
                    if error != nil{
                        print("error in notification! ")
                    }
                    else {
                        print("Added notification: \(name), \(hour):\(minute)")
                    }
                }
                        
              
                
           }
           else {
              print("user denied")
           }
       }
    }
}
