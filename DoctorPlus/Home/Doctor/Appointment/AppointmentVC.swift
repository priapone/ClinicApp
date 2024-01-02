//
//  AppointmentVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class AppointmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var navigationView: Navigationbar!
    
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "DatePickerCell", bundle: nil), forCellReuseIdentifier: "DatePickerCell")
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
            tableView.register(UINib(nibName: "TimePickerCell", bundle: nil), forCellReuseIdentifier: "TimePickerCell")
        }
    }
    var isappointmentVC : Bool = true
    var doctor: DoctorDetail = DoctorDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.TitleLebal.text = "Appuntamento"
       
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func confirmBtnAction(_ sender: UIButton) {
        let vc = PastientDetailsVC()
        vc.doctor = self.doctor
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else{
            return 1
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerCell
            return dateCell
        }
        else{
            let timeCell = tableView.dequeueReusableCell(withIdentifier: "TimePickerCell", for: indexPath) as! TimePickerCell
            timeCell.morningSlot = doctor.morningSlot
            timeCell.afternoonSlot = doctor.afternoonSlot
            timeCell.eveningSlot = doctor.eveningSlot
            return timeCell
        }
        
    }
    
    //MARK: - tableview heading
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleWithBtnTBVHeaderView") as! TitleWithBtnTBVHeaderView
        if section == 0{
            header.lblTitle.text = "Select Date"
            header.lblTitle.textColor = UIColor.Mycolor()
            return header
        }
        else {
            header.lblTitle.text = "Select Time"
            header.lblTitle.textColor = UIColor.Mycolor()
            return header
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    
    
}
