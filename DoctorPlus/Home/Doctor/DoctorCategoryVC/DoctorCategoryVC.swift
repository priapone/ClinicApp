//
//  DoctorCategoryVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class DoctorCategoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var colllectionView: UICollectionView!{
        didSet{
            colllectionView.register(UINib(nibName: "cellForDoctorCategory", bundle: nil), forCellWithReuseIdentifier: "cellForDoctorCategory")
        }
    }
    
    var nameOfSpeclistDoctor = ["General Doctor","Child Doctor","Skin Doctor","Aurveda","Dentist","Homeopathic","Nephrology","Cardiologist","ENT","Gynaecologist","Psychiatrists","Orthopaedic","Neurologist"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.TitleLebal.text = "Categories"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        colllectionView.delegate = self
        colllectionView.dataSource = self
    }

    
    
    //MARK: - collection view delegate and datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameOfSpeclistDoctor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellForDoctorCategory", for: indexPath) as! cellForDoctorCategory
        cell.lblNameOfCategory.text = nameOfSpeclistDoctor[indexPath.row]
        
        if  indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 8{
            cell.lblView.backgroundColor = .hexColor(hex: "E0F7FA")
            cell.lblNameOfCategory.textColor = .hexColor(hex: "06919D")
        }
        else if indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 9{
            cell.lblView.backgroundColor = .hexColor(hex: "E0F2F1")
            cell.lblNameOfCategory.textColor = .hexColor(hex: "0F6E69")
        }
        else if indexPath.row == 2 || indexPath.row == 6 || indexPath.row == 10{
            cell.lblView.backgroundColor = .hexColor(hex: "E8F5E9")
            cell.lblNameOfCategory.textColor = .hexColor(hex: "0FA71B")
        }
        else if indexPath.row == 3 || indexPath.row == 7 || indexPath.row == 11{
            cell.lblView.backgroundColor = .hexColor(hex: "F1F8E9")
            cell.lblNameOfCategory.textColor = .hexColor(hex: "4C7221")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.colllectionView.frame.width - 20 )  / 2
        return .init(width: width, height: 97)
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DentistVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
