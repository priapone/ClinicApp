//
//  ForgetVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 15/07/22.
//

import UIKit

class ForgetVC: UIViewController,UITextFieldDelegate {


    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var emailid: UITextField!
    var isFromSignin:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigtionbar("Forget Pasword")
        hidekeyboardtapArround()
        emailid.delegate = self
        
        navigationView.TitleLebal.text  = "Forget Password"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }
    
    @IBAction func Sendbutton(_ sender: UIButton) {
//        if !(Emailid.text!.IsvalidEmailid()){
//            Emailalert()
//        }
//        else{
            let forgetvc = OtpVerifyVC()
            self.navigationController?.pushViewController(forgetvc, animated: true)
//        }
    }
}
