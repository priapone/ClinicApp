//
//  SignupVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 13/07/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupVC: UIViewController,UITextFieldDelegate{

    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var Name: UITextField!
    @IBOutlet var Emailid: UITextField!
    @IBOutlet var Phonenumer: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var Conformpassword: UITextField!

    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidekeyboardtapArround()
        Name.delegate = self
        Emailid.delegate = self
        Phonenumer.delegate = self
        password.delegate = self
        Conformpassword.delegate = self
        
        self.navigationView.onTapBackAction = {
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
    
    //MARK: - Signup button
    
    @IBAction func Sinupbutton(_ sender: UIButton) {
        if (Name.text!.isEmpty || Emailid.text!.isEmpty || Phonenumer.text!.isEmpty || password.text!.isEmpty || Conformpassword.text!.isEmpty) {
            showAlertMessage(title: "ATTENZIONE", message: "Devi riempire tutte le caselle!")
        }
//        else if !(Emailid.text!.IsvalidEmailid()){
//            showAlertMessage(title: "ATTENZIONE", message: "Manca l'email o email errata!")
//        }
        else if !(Phonenumer.text!.IsValidphone()){
            showAlertMessage(title: "ATTENZIONE", message: "Manca il telefono!")
        }
//        else if !(password.text!.IsvalidPassword()){
//            showAlertMessage(title: "ATTENZIONE", message: "Pwd non corretta!")
//        }
        else if !(password.text == Conformpassword.text){
            showAlertMessage(title: "ATTENZIONE", message: "Le password non corrispondono!")
        }
        else{
//            let otp = OtpVC()
//            self.navigationController?.pushViewController(otp, animated: true)
            if let email = Emailid.text, let password = password.text {
                Auth.auth().createUser(withEmail: email, password: password) { authresult, error in
                    if let e = error {
                        print(e)
                    } else {
                        
                        if let user = Auth.auth().currentUser {
                            let uid = user.uid
                            let email = user.email
                            //let photoURL = user.photoURL
//                            self.db.collection("UserData").addDocument(data: ["uid" : uid, "email": email!, "displayName":  self.Name.text!])
                            self.db.collection("UserData").document(uid).setData(["email": email!, "displayName": self.Name.text!])
                        }
                        let oksignupvc = OKSignupVC()
                        self.navigationController?.pushViewController(oksignupvc, animated: true)
                    }
                }
            }

            
        }
    }
    
    //MARK: - Sigin button
    
    @IBAction func Signin(_ sender: UIButton) {
        let Signinvc = LoginVC()
        self.navigationController?.pushViewController(Signinvc, animated: true)
    }
    
   
    
    
}



