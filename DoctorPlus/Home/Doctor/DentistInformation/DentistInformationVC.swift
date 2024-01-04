//
//  DentistInformationVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit
import SDWebImage
import FirebaseStorage
import FirebaseStorageUI

class DentistInformationVC: UIViewController {

   
    @IBOutlet weak var labelCV: UILabel!
    @IBOutlet weak var labelSpecialist: UILabel!
    @IBOutlet weak var labelDoctorName: UILabel!
    @IBOutlet var patienView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ratingViwe: UIView!
    @IBOutlet var experienceView: UIView!
    
    let urlImage = "gs://ambulatorio-spinea.appspot.com"

//    var txtDoctorName: String = ""
//    var txtSpecialist: String = ""
//    var txtCV: String = ""
//    var img: UIImage = UIImage()
    var isappointmentVC : Bool = true
    var doctor: DoctorDetail = DoctorDetail(image: UIImage(), name: "", surname: "", specialist: "", cv: "")
    
    init(doctor: DoctorDetail) {
        super.init(nibName: nil, bundle: Bundle.main)
        
        self.doctor = doctor
//        self.txtDoctorName = doctor.name
//        self.txtSpecialist = doctor.specialist
//        self.txtCV = doctor.cv
//        self.img = doctor.image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
        let gsReference = storage.reference(forURL: "\(urlImage)/Doctor1.png")
        
        labelDoctorName.text = "\(doctor.name) \(doctor.surname)"
        labelSpecialist.text = doctor.specialist
        labelCV.text = doctor.cv
        //imageView.image = doctor.image
        let placeholderImage = UIImage(named: "placeholder.jpg")
        imageView.sd_setImage(with: gsReference, placeholderImage: placeholderImage)
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
        vc.doctor = self.doctor
        vc.isappointmentVC = self.isappointmentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
