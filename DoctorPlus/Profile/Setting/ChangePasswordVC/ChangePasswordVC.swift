//
//  ChangePasswordVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class ChangePasswordVC: UIViewController,UITextFieldDelegate{

    @IBOutlet var navigationView: Navigationbar!
    
    @IBOutlet var oldPasswordTxt: UITextField!
    @IBOutlet var repeatPasswordTxt: UITextField!
    @IBOutlet var newPasswordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Change Password"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated:  true)
        }
        
        oldPasswordTxt.delegate = self
        repeatPasswordTxt.delegate = self
        newPasswordTxt.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
       textField.addShadowToTextField(cornerRadius: 5)
   }
    func textFieldDidEndEditing(_ textField: UITextField) {
       textField.removeShadow()
   }

   
}
