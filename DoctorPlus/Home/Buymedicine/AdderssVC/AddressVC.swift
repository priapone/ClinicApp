//
//  AddressVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class AddressVC : UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "AddressCell")
            tableView.register(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
        }
    }
    
    var nameOfAddress = ["Home","Office"]
    var paymentMethod = ["Master card","PayPal","Creditcard","Visa"]
    var imagePayemnt = ["Group 136","Group 51","Group 138","Group 137"]
    var header = ["Address","Payment method"]
    
    var addressSelection : String = ""
    var paymentSelection : String = ""
    var isappointmentVC : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.TitleLebal.text = "Address"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - continuebtnaction
    
    @IBAction func ContinueBtnAction(_ sender: UIButton){
        let vc = ChooseCreditcardVC()
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - tableview delgate and datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nameOfAddress.count
        }
        else{
            return imagePayemnt.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let addCell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath ) as! AddressCell
        let paycell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
        
        if indexPath.section == 0{
            addCell.lblHome.text = nameOfAddress[indexPath.row]
            addCell.selectionStyle = .none
            addCell.imageSelect.isHighlighted = (addressSelection.lowercased() == nameOfAddress[indexPath.row].lowercased())
            addCell.onTapEdit = {
              let vc = AddAddressVC()
              self.navigationController?.pushViewController(vc, animated: true)
            }
            
            return addCell
        }
        else{
            paycell.imageCard.image = UIImage(named: imagePayemnt[indexPath.row])
            paycell.lblCardName.text = paymentMethod[indexPath.row]
            paycell.selectionStyle = .none
            paycell.imageSelect.isHighlighted = (paymentSelection.lowercased() == paymentMethod[indexPath.row].lowercased())
           
            return paycell
        }
    }
    
    //MARK: - tableview heading
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleWithBtnTBVHeaderView") as! TitleWithBtnTBVHeaderView
        if section == 0{
            header.lblTitle.text = "Address"
            return header
        }
        else{
            header.lblTitle.text = "Payment method"
            return header
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    
    
    //MARK: - select the row
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            addressSelection = nameOfAddress[indexPath.row]
        }
        else{
            paymentSelection = paymentMethod[indexPath.row]
        }
        self.tableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .automatic)
    }
}


