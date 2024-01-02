//
//  PharmacyVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 21/07/22.
//

import UIKit

class PharmacyVC: UIViewController {

    @IBOutlet var navigationView: Navigationbar!
    
    @IBOutlet var minuesBtn: UIButton!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var qtyLbl: UILabel!
    @IBOutlet var ratelbl: UILabel!
    @IBOutlet var tablet120: UITextField!
    @IBOutlet var weight300: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.tintColor = .hexColor(hex: "06919D")
        navigationView.TitleLebal.isHidden = true
        
        tablet120.addShadowToTextField(cornerRadius: 5)
        weight300.addShadowToTextField(cornerRadius: 5)
    }
     
    var count = 1
    var price = 11.50
    
    //MARK: - plusbtnaction

    @IBAction func plusBtnAction(_ sender: UIButton) {
        qtyLbl.text = "\(count + 1)"
        count += 1
        ratelbl.text = "$ \(price + 11.50)"
        price += 11.50
         
        if count > 0{
            minuesBtn.isEnabled = true
        }
    }

    //MARK: - minuesbtnaction

    @IBAction func minuesBtnAction(_ sender: UIButton) {
        qtyLbl.text = "\(count - 1)"
        count -= 1
        ratelbl.text = "$ \(price - 11.50)"
        price -= 11.50
        
        if count == 0{
            minuesBtn.isEnabled = false
        }
    }
    
    
    //MARK: - addtocartbtnaction

    @IBAction func addToCartBtnAction(_ sender: UIButton) {
        let vc = CartVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
