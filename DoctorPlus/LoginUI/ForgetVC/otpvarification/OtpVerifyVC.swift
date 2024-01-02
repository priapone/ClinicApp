//
//  OtpVerifyVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 18/07/22.
//

import UIKit

class OtpVerifyVC: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var Otp1: UITextField!
    @IBOutlet var Otp2: UITextField!
    @IBOutlet var Otp3: UITextField!
    @IBOutlet var Otp4: UITextField!
    @IBOutlet var Confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Otp1.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        Otp2.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        Otp3.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        Otp4.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        
//        Confirm.isEnabled = false
        setNavigtionbar("Otp verification")
        hidekeyboardtapArround()
        Otp1.delegate = self
        Otp2.delegate = self
        Otp3.delegate = self
        Otp4.delegate = self
        navigationView.TitleLebal.text = "Otp Verification"
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
    
    @IBAction func Otp4texfiled(_ sender: UITextField) {
        if !(Otp4.text!.isEmpty){
            Confirm.isEnabled = true
        }
        else{
            Confirm.isEnabled = false
        }
    }
    
    @objc func changecharcter(textfield: UITextField){
        if textfield.text?.utf16.count == 1 {
            switch textfield {
            case Otp1:
                 Otp2.becomeFirstResponder()
            case Otp2:
                Otp3.becomeFirstResponder()
            case Otp3:
                Otp4.becomeFirstResponder()
            case Otp4:
                Otp4.resignFirstResponder()
            default:
                break
            }
        }
        else if (textfield.text!.isEmpty){
            switch textfield {
            case Otp4:
                Otp3.becomeFirstResponder()
            case Otp3:
                Otp2.becomeFirstResponder()
            case Otp2:
                Otp1.becomeFirstResponder()
            default:
                break
            }
        }
   }

    @IBAction func Conform(_ sender: UIButton) {
//        if !(Otp1.text!.isEmpty || Otp2.text!.isEmpty || Otp3.text!.isEmpty || Otp4.text!.isEmpty){
            let otpvc = NewpasswordVC()
            self.navigationController?.pushViewController(otpvc, animated: true)
//        }
    }
    
}
