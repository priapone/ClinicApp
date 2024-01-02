//
//  HelpVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class HelpVC: UIViewController {

    
    @IBOutlet var navigationView: Navigationbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Help"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }


}
