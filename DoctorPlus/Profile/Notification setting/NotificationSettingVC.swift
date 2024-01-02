//
//  NotificationSettingVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class NotificationSettingVC: UIViewController {

    @IBOutlet var navigationView: Navigationbar!
    
    @IBOutlet var view3: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 5
        view1.layer.borderColor = UIColor.Mycolor().cgColor
        view1.layer.borderWidth = 0.4
        view2.layer.cornerRadius = 5
        view2.layer.borderColor = UIColor.Mycolor().cgColor
        view2.layer.borderWidth = 0.4
        view3.layer.cornerRadius = 5
        view3.layer.borderColor = UIColor.Mycolor().cgColor
        view3.layer.borderWidth = 0.4
        
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.TitleLebal.text = "Notification"
    }

}
