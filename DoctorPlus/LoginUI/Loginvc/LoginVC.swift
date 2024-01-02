//
//  LoginVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 13/07/22.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var Emailid: UITextField!
    @IBOutlet var Signin: UIButton!
    @IBOutlet var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Signin.isEnabled = true
        Emailid.delegate = self
        Password.delegate = self
        Password.isSecureTextEntry = true
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }

    @IBAction func SignUpbutton(_ sender: UIButton) {
        let signUp =  SignupVC()
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    @IBAction func ForgetPassword(_ sender: UIButton) {
        let vc = ForgetVC()
        vc.isFromSignin = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Signinclick(_ sender: UIButton) {
            if (!(Emailid.text!.IsvalidEmailid()) && !(Password.text!.IsvalidPassword())){
                EmailPasswordalert()
            }
//            else if !(Emailid.text!.IsvalidEmailid()){
//               Emailalert()
//            }
//            else if !(Password.text!.IsvalidPassword()){
//               Passwordalert()
//            }
            else{
                Signin.isEnabled = true
                if let email = Emailid.text, let password = Password.text
                {
                    Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                        if let e = error {
                            print(e)
                            self.showAlertMessage(title: "ATTENZIONE", message: "Errore nell'identificazione")
                        }
                        else
                        {
                            let vc = UIStoryboard.init(name: "Storyboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Tabbar") as! UITabBarController
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                      // ...
                    }
                }
//                let vc = OtpVC()
//                self.navigationController?.pushViewController(vc, animated: true)
           }
    }
    
    
    @IBAction func Email(_ sender: UITextField) {
        if (!(Emailid.text!.isEmpty) && !(Password.text!.isEmpty)){
            Signin.isEnabled = true
        }
        else{
            Signin.isEnabled = false
        }
    }
    @IBAction func Password(_ sender: UITextField) {
        if (!(Emailid.text!.isEmpty) && !(Password.text!.isEmpty)){
            Signin.isEnabled = true
        }
        else{
            Signin.isEnabled = false
        }
    }
}

