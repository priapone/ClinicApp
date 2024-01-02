//
//  DentistVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class DentistVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "DoctorLeftCell", bundle: nil), forCellReuseIdentifier: "DoctorLeftCell")
            tableView.register(UINib(nibName: "DoctorRightCell", bundle: nil), forCellReuseIdentifier: "DoctorRightCell")
        }
    }
    var Dentist : [DoctorDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationView.TitleLebal.text = "Dentist"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        DoctorCategory()
    }

    func DoctorCategory(){
        
         Dentist = [
                    DoctorDetail(image: UIImage(named: "100")!, name: "Dr.Robot Smith", specilist: "Dentist"),
                    DoctorDetail(image: UIImage(named: "200")!, name: "Dr.Robot Smith", specilist: "Dentist"),
                    DoctorDetail(image: UIImage(named: "300")!, name: "Dr.robort Smith", specilist: "Dentist")
                 ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dentist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = tableView.dequeueReusableCell(withIdentifier: "DoctorLeftCell", for: indexPath) as!  DoctorLeftCell
        let rightCell = tableView.dequeueReusableCell(withIdentifier: "DoctorRightCell", for: indexPath) as! DoctorRightCell
        
        let Dentistitem = Dentist[indexPath.row]
        
        if indexPath.row % 2 == 0{
            leftCell.lblNameDoctor.text = "\(Dentistitem.name)"
            leftCell.imageDoctor.image  =  Dentistitem.image
            leftCell.lblNameDoctor.text = "\(Dentistitem.name)"
            leftCell.lblSpecialist.text = "\(Dentistitem.specilist)"
            return leftCell
        }
        else{
            rightCell.lblDoctorName.text = "\(Dentistitem.name)"
            rightCell.imageOfDoctor.image = Dentistitem.image
            rightCell.lblSpecilist.text = "\(Dentistitem.specilist)"
            return rightCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DentistInformationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
