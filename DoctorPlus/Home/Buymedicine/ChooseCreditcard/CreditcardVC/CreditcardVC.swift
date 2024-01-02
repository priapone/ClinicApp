//
//  CreditcardVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class CreditcardVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var txtCardNumber: UITextField!
    @IBOutlet var txtValid: UITextField!
    @IBOutlet var txtCvv: UITextField!
    @IBOutlet var txtCardHoldername: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationView.TitleLebal.text = "Credit Card"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        txtCvv.delegate = self
        txtValid.delegate = self
        txtCardNumber.delegate = self
        txtCardHoldername.delegate = self
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }
    
    
    @IBAction func addBtnAction(_ sender: UIButton) {
      let vc = ChooseCreditcardVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
