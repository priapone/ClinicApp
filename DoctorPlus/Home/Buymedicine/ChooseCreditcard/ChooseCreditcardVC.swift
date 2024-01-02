//
//  ChooseCreditcardVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit
import MapKit

class ChooseCreditcardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var btnAddnew: UIButton!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "CardCell")
        }
    }
    
    var cardNumber = ["XXXX XXXX XXXX 1489","XXXX XXXX XXXX 1489","XXXX XXXX XXXX 1489"]
    var nameofCustomer = ["Isha John","Jesvin patel","Isha John"]
    var isappointmentVC : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAddnew.addShadowToButton(cornerRadius: 10)
    
        tableView.delegate = self
        tableView.dataSource = self
        navigationView.TitleLebal.text = "Choose Card"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameofCustomer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! CardCell
        cell.lblName.text = nameofCustomer[indexPath.row]
        cell.lblCardNumber.text = cardNumber[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addCell = tableView.cellForRow(at: indexPath) as! CardCell
        addCell.imageSelect.image = UIImage(named: "Group 127")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let addCell = tableView.cellForRow(at: indexPath) as! CardCell
        addCell.imageSelect.image = UIImage(named: "Group 128")
    }
    
    @IBAction func addNewbtnAction(_ sender: UIButton) {
        let vc = CreditcardVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func paynowBtnAction(_ sender: UIButton) {
            let vc = SucessVC()
            vc.isappointmentVC = self.isappointmentVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
}
