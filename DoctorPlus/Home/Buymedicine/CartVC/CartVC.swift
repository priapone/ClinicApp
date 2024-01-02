//
//  CartVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 22/07/22.
//

import UIKit

class CartVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tabelView: UITableView!{
        didSet{
            tabelView.register(UINib(nibName: "CartVCCell", bundle: nil), forCellReuseIdentifier: "CartVCCell")
            tabelView.register(UINib(nibName: "InofrmationVCCell", bundle: nil), forCellReuseIdentifier: "InofrmationVCCell")
        }
    }
    var productDetails : [cartDetails] = []
    var isappointmentVC : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.TitleLebal.text = "Cart"
        tabelView.delegate = self
        tabelView.dataSource = self
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        cartProductInit()
        tabelView.rowHeight = 130
    
        
    }
    
    func cartProductInit() {
        
        productDetails.append(cartDetails(image: UIImage(named: "Rectangle 84")!, title: "Vitamin  A-Complex", Descripition: "15 tablate in strip", price: 11 , qty: 1))
        productDetails.append(cartDetails(image: UIImage(named: "Rectangle 84")!, title: "Vitamin  B-Complex", Descripition: "15 tablate in strip", price: 15, qty: 1))
        productDetails.append(cartDetails(image: UIImage(named: "Rectangle 84")!, title: "Vitamin  B-Complex", Descripition: "15 tablate in strip", price: 17, qty: 1))
    }
    
    
    
    
    
    //MARK: - continuebtnaction

    @IBAction func continueBtnAction(_ sender: UIButton) {
        let vc = AddressVC()
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    //MARK: - collectionview delegate and datasoruce
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return productDetails.count
        }
        else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cartCell = tableView.dequeueReusableCell(withIdentifier: "CartVCCell", for: indexPath) as! CartVCCell
        let informationCell = tableView.dequeueReusableCell(withIdentifier: "InofrmationVCCell", for: indexPath) as! InofrmationVCCell
        
        if indexPath.section == 0 {
            
            let item = productDetails[indexPath.row]
            
            cartCell.lblQty.text = "\(item.qty)"
            cartCell.lblPrice.text = "$ \(item.price * Double(item.qty))"
            cartCell.lblNameOfMedicine.text = "\(item.title)"
            cartCell.imageMedicine.image =  item.image
            cartCell.lblDescription.text = "\(item.Descripition)"
            
            
            cartCell.onTapPlus = { count in
                self.productDetails[indexPath.row].qty = (Int(count) + 1)
                self.tabelView.reloadSections(IndexSet.init(integer: indexPath.section), with: .automatic)
                self.tabelView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
            }
            
            cartCell.onTapMinus = { count in
                if count == 1 {
                    let alertVc = UIAlertController(title: "Alert", message: "Are you sure you want to remove?", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { getOkAct in
                        self.productDetails.remove(at: indexPath.row)
                        self.tabelView.reloadSections(IndexSet.init(integer: indexPath.section), with: .automatic)
                        self.tabelView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertVc.addAction(okAction)
                    alertVc.addAction(cancelAction)
                    self.present(alertVc, animated: true, completion: nil)
                }else{
                    self.productDetails[indexPath.row].qty = (Int(count) - 1)
                    self.tabelView.reloadSections(IndexSet.init(integer: indexPath.section), with: .automatic)
                    self.tabelView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
                }
                
                
            }
            return cartCell
        }
        else{
            //MARK: - sum of price
            
            let productPriceList : [Double] = productDetails.map({ return (($0.price) * Double(($0.qty))) })
            let totalAmount = productPriceList.reduce(0.0 , +)
            informationCell.lblSubTotal.text = "$ \(totalAmount)"
            informationCell.lblTotal.text = "$ \(totalAmount + 5)"
            return informationCell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete{
                tableView.beginUpdates()
                self.productDetails.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        
    }
}
