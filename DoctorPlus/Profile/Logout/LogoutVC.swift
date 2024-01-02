//
//  LogoutVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class LogoutVC: UIViewController {

    @IBOutlet var LogoutView: UIView!
    @IBOutlet var cancelView: UIView!
    @IBOutlet var viewLogout: UIView!
    @IBOutlet var logoutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelView.layer.cornerRadius = 10
        cancelView.layer.borderColor = UIColor.gray.cgColor
        cancelView.layer.borderWidth = 0.2
        
        LogoutView.layer.cornerRadius = 10
        LogoutView.layer.borderColor = UIColor.gray.cgColor
        LogoutView.layer.borderWidth = 0.4
        
        viewLogout.layer.cornerRadius = 10
        viewLogout.clipsToBounds = false
        
    }
    var ontapLogOutBtn : (()->())? = nil
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogoutBtnAction(_ sender: UIButton) {
        if let getAct = self.ontapLogOutBtn{
            getAct()
        }
    }
}
