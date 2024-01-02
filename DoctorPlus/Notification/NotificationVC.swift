//
//  NotificationVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class NotificationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var notificationView: UIView!
    @IBOutlet var navigationView: Navigationbar!
    
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
        }
    }
    
    var detailsOfNotification : [[NotificationDetails]] = []
    var headerDetails = ["Today","Yesterday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.backbutton.isHidden = true
        navigationView.TitleLebal.text = "Notification"
        notificationView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let notification1Details = [ NotificationDetails(title: "Reminder For appointment", Description: "Upcoming                             appointment with dr shah at 5th feb.", time: "2 min ago"),
                                  NotificationDetails(title: "Medicine", Description: "Your Order Vitamin-D tablets was the deliver successful.", time: "5 min ago")
        ]
        let notification2Details = [ NotificationDetails(title: "Reminder For appointment", Description: "Upcoming                             appointment with dr shah at 5th feb.", time: "2 min ago"),
                             NotificationDetails(title: "Medicine", Description: "Your Order Vitamin-D tablets was the deliver successful.", time: "5 min ago"),
                             NotificationDetails(title: "Reminder For appointment", Description: "Upcoming                             appointment with dr shah at 5th feb.", time: "2 min ago")
        ]
        self.detailsOfNotification.append(notification1Details)
        self.detailsOfNotification.append(notification2Details)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerDetails.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailsOfNotification[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! NotificationCell
        cell.Setup(detailsOfNotification[indexPath.section][indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleWithBtnTBVHeaderView") as! TitleWithBtnTBVHeaderView
        
        headerView.lblTitle.text = headerDetails[section]
        headerView.btnSeeall.isHidden = false
        headerView.btnSeeall.setTitle("Clear all", for: .normal)
        
        headerView.OntapSeeall = {
            self.headerDetails.remove(at: section)
            self.detailsOfNotification.remove(at: section)
            if (self.detailsOfNotification.isEmpty) {
                self.notificationView.isHidden = false
            }
            self.tableView.reloadData()
            
        }
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
}
