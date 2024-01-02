//
//  NewpasswordVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 18/07/22.
//

import UIKit

class NewpasswordVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var password: UITextField!
    @IBOutlet var Conformpassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigtionbar("New Password")
        hidekeyboardtapArround()
        password.delegate = self
        Conformpassword.delegate = self
        
        navigationView.TitleLebal.text = "New Password"
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
    
    @IBAction func Submitbutton(_ sender: UIButton) {
//        if !(password.text!.IsvalidPassword()){
//            Passwordalert()
//        }
//        else if !(password.text == Conformpassword.text){
//            Passwordmatch()
//        }
        let vc = UIStoryboard.init(name: "Storyboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Tabbar") as! UITabBarController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
