//
//  PastientDetailsVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class PastientDetailsVC: UIViewController , UITextFieldDelegate {

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPasientName: UITextField!
    @IBOutlet var txtPhonenumber: UITextField!
    @IBOutlet var txtReasonforVisit: UITextField!
    var isappointmentVC : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationView.TitleLebal.text = "Patients detail"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        txtName.delegate = self
        txtPhonenumber.delegate = self
        txtPasientName.delegate = self
        txtReasonforVisit.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }

    @IBAction func continueBtnAction(_ sender: UIButton) {
        let vc = AddressVC()
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
