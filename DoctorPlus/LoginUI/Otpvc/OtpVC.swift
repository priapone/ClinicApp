//
//  OtpVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 13/07/22.
//

import UIKit



class OtpVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var otp1: UITextField!
    @IBOutlet var otp2: UITextField!
    @IBOutlet var otp3: UITextField!
    @IBOutlet var otp4: UITextField!
    @IBOutlet var conitinueBtn: UIButton!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otp1.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        otp2.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        otp3.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        otp4.addTarget(self, action: #selector(changecharcter), for: .editingChanged)
        
//        conitinueBtn.isEnabled = false
        setNavigtionbar()
        hidekeyboardtapArround()
        
        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.TitleLebal.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }
    
    @IBAction func otp4Texfiled(_ sender: UITextField) {
        if !(otp4.text!.isEmpty){
            conitinueBtn.isEnabled = true
        }
        else{
            conitinueBtn.isEnabled = false
        }
    }
    
    @objc func changecharcter(textfield: UITextField){
        if textfield.text?.utf16.count == 1 {
            switch textfield {
            case otp1:
                 otp2.becomeFirstResponder()
            case otp2:
                otp3.becomeFirstResponder()
            case otp3:
                otp4.becomeFirstResponder()
            case otp4:
                otp4.resignFirstResponder()
            default:
                break
            }
        }
        else if (textfield.text!.isEmpty){
            switch textfield {
            case otp4:
                otp3.becomeFirstResponder()
            case otp3:
                otp2.becomeFirstResponder()
            case otp2:
                otp1.becomeFirstResponder()
            default:
                break
            }
        }
   }

    @IBAction func Continuebutton(_ sender: UIButton) {
//        if !(otp1.text!.isEmpty || otp2.text!.isEmpty || otp3.text!.isEmpty || otp4.text!.isEmpty){
        let vc = UIStoryboard.init(name: "Storyboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Tabbar") as! UITabBarController
        self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
   
}
