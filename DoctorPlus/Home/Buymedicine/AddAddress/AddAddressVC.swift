//
//  AddAddressVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class AddAddressVC: UIViewController, UITextFieldDelegate {


    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var txtCustomerName: UITextField!
    @IBOutlet var txtPhonenumer: UITextField!
    @IBOutlet var txtEmaiid: UITextField!
    @IBOutlet var txtHouseno: UITextField!
    @IBOutlet var txtStreetName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Add address"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        txtCustomerName.delegate = self
        txtPhonenumer.delegate = self
        txtEmaiid.delegate = self
        txtHouseno.delegate = self
        txtStreetName.delegate = self
        
        
        
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }
    
    @IBAction func addBtnAction(_ sender: UIButton) {
        
    }
    
}
