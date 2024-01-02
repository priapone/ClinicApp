//
//  SucessVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 26/07/22.
//

import UIKit

class SucessVC: UIViewController {

    @IBOutlet var lblAppointment: UILabel!
    @IBOutlet var descriptionTxt: UILabel!
    @IBOutlet var imageView: UIImageView!
    var isappointmentVC : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isappointmentVC == true{
            imageView.image = UIImage(named: "Calendar")
            descriptionTxt.text = "Your appointment with dr. zankhi  on 7th december 2021 at 2.30 pm is confirmed"
            lblAppointment.isHidden = false
        }
    }

    @IBAction func backBtnAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Storyboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Tabbar") as! UITabBarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
