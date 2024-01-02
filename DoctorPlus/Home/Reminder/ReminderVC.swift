//
//  ReminderVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class ReminderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "ReminderViewCell", bundle: nil), forCellReuseIdentifier: "ReminderViewCell")
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
        }
    }
    
    var imageForMedicine = ["10","13","14","Rectangle 84","15","10"]
    var timeForReminder = ["8 PM","2 PM","3 PM","7 PM","8 PM","9 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - navigation lbl

        navigationView.TitleLebal.text = "Reminder"
        navigationView.TitleLebal.textColor =  .Mycolor()
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - tableview Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageForMedicine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminderCell = self.tableView.dequeueReusableCell(withIdentifier: "ReminderViewCell", for: indexPath) as! ReminderViewCell
        reminderCell.lblTime.text = timeForReminder[indexPath.row]
        reminderCell.ImageForMedicine.image = UIImage(named: imageForMedicine[indexPath.row])
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
        headerView.lblTitle.text = "Wednesday, 7 March"
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
}
