//
//  DoctorVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 26/07/22.
//

import UIKit

class DoctorVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var navigationview: Navigationbar!
    @IBOutlet var tableView: UITableView! {
        didSet{
            tableView.register(UINib(nibName: "DoctorLeftCell", bundle: nil), forCellReuseIdentifier: "DoctorLeftCell")
            tableView.register(UINib(nibName: "DoctorRightCell", bundle: nil), forCellReuseIdentifier: "DoctorRightCell")
            tableView.register(UINib(nibName: "categoryCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
            tableView.register(UINib(nibName: "TitleWithBtnTBVHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TitleWithBtnTBVHeaderView")
        }
    }
    var Doctor : [DoctorDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: - navigation lbl
        let fullString = NSMutableAttributedString(string: "  ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "Doctor")
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: "  Doctor"))
        self.navigationview.TitleLebal.attributedText = fullString
        navigationview.TitleLebal.textColor =  .Mycolor()
        navigationview.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        DoctorCategory()
    }
    
    
    
    func DoctorCategory(){
        
        Doctor = [
            DoctorDetail(image: UIImage(named: "100")!, name: "Mauro", surname: "De Bellis", specialist: "Neurologo", cv: "Prova di CV di Mauro De Bellis", morningSlot: ["10.10","10.30","10.50","11.20","11.50"], afternoonSlot: ["14.00","14.30","15.00"], eveningSlot: ["19.00","19.30","20.00","20.30"]),
            DoctorDetail(image: UIImage(named: "200")!, name: "Antonio", surname: "Berizzi", specialist: "Ortopedico", cv: "Prova di CV di Antonio Berizzi"),
            DoctorDetail(image: UIImage(named: "300")!, name: "Ezio", surname: "Zanon", specialist: "Ematologo", cv: "Prova di CV di Ezio Zanon")
        ]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else{
            return Doctor.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let drCategoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! categoryCell
            return drCategoryCell
        }
        else{
            let doctorCell = tableView.dequeueReusableCell(withIdentifier: "DoctorLeftCell", for: indexPath) as! DoctorLeftCell
            let rightcell = tableView.dequeueReusableCell(withIdentifier: "DoctorRightCell", for: indexPath) as! DoctorRightCell
            
            
            let itemOfImage = Doctor[indexPath.row]
            
            if indexPath.row % 2 == 0{
                doctorCell.imageDoctor.image  =  itemOfImage.image
                doctorCell.lblNameDoctor.text = "\(itemOfImage.name) \(itemOfImage.surname)"
                doctorCell.lblSpecialist.text = "\(itemOfImage.specialist)"
                return doctorCell
            }
            else{
                rightcell.lblDoctorName.text = "\(itemOfImage.name) \(itemOfImage.surname)"
                rightcell.imageOfDoctor.image = itemOfImage.image
                rightcell.lblSpecilist.text = "\(itemOfImage.specialist)"
                return rightcell
            }
        }
    }
    
    //MARK: - tableview heading
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleWithBtnTBVHeaderView") as! TitleWithBtnTBVHeaderView
        headerView.btnSeeall.isHidden = false
        if section == 1{
            headerView.lblTitle.text = "Popular Doctor"
        }
        else{
            headerView.lblTitle.text = "Categoria"
        }
        headerView.OntapSeeall = {
            if section == 0 {
                let vc = DoctorCategoryVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }else {
//                let vc = DentistVC()
//                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor = Doctor[indexPath.row]
        let vc = DentistInformationVC(doctor: doctor)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
