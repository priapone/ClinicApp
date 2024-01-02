//
//  PastientDetailsVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class PastientDetailsVC: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var txtSpecialist: UILabel!
    @IBOutlet weak var txtDoctorName: UILabel!
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPasientName: UITextField!
    @IBOutlet var txtPhonenumber: UITextField!
    @IBOutlet var txtReasonforVisit: UITextField!
    var doctor: DoctorDetail = DoctorDetail()
    var isappointmentVC : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationView.TitleLebal.text = "Dettaglio paziente"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        txtDoctorName.text = "dr. \(doctor.name) \(doctor.surname)"
        txtSpecialist.text = "\(doctor.specialist)"
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
