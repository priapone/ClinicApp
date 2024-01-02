//
//  DentistInformationVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class DentistInformationVC: UIViewController {

   
    @IBOutlet var patienView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ratingViwe: UIView!
    @IBOutlet var experienceView: UIView!
    
    var isappointmentVC : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        patienView.addShadow()
        ratingViwe.addShadow()
        experienceView.addShadow()
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loactionBtnAction(_ sender: UIButton) {
        let vc = LocationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bookAppointmentBtnAction(_ sender: UIButton) {
        let vc = AppointmentVC()
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
