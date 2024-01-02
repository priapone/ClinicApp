//
//  SerchVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 21/07/22.
//

import UIKit
import IQKeyboardManagerSwift

class SerchVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var serchBar: UISearchBar!
    @IBOutlet var colletionView: UICollectionView!{
        didSet{
            colletionView.register(UINib.init(nibName: "SerchCVCell", bundle: nil), forCellWithReuseIdentifier: "SerchCVCell")
            colletionView.register(UINib.init(nibName: "MedicineVCCell", bundle: nil), forCellWithReuseIdentifier: "MedicineVCCell")
            colletionView.register(UINib(nibName: "CollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
            
        }
    }
    
    //MARK: - cell
    
    var medicineName = ["Allopathy","Homeopathic","Homeopathic","Orthopadic","Diabetes","Antibiotics","General medicine","Gynaecology"]
    var categoryHeader  = ["Category"]
    
    //MARK: - medicineCell
    
    var typeMedicine = ["Beximco Pharma","Squared ltd","Beximco Pharma","Squared ltd","Beximco Pharma","Squared ltd"]
    var medicineImage = ["11","10","12","13","10","11"]
    var wightmedicine = ["Calbo-D","Antazol","Calbo-D","Antazol","Calbo-D","Antazol"]
    var nameMedicine = ["Calcium Carbon","Xylometazoline","Calcium Carbon","Xylometazoline","Calcium Carbon","Xylometazoline"]
    var priceMedicine = ["$10"," $10","$10","$10","$10","$10"]
    var getNavigationTitle:String = "Buy Medicine"
    
    
    var serching = false
    var serchCategory = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        colletionView.delegate = self
        colletionView.dataSource = self
        serchBar.delegate = self
        
        
        //MARK: - navigation lbl
        self.navigationView.TitleLebal.text = getNavigationTitle
        navigationView.TitleLebal.textColor =  .Mycolor()
        self.setupTextFields()
        
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        self.serchBar.inputAccessoryView = toolbar
        self.serchBar.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    //MARK: - collectionview delegate and datasoruce
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if serching && section == 0{
            return serchCategory.count
        }
        else if section == 0{
            return medicineName.count
        }
        else{
            return medicineImage.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.colletionView.dequeueReusableCell(withReuseIdentifier: "SerchCVCell", for: indexPath) as! SerchCVCell
        let medicineCell = self.colletionView.dequeueReusableCell(withReuseIdentifier: "MedicineVCCell", for: indexPath) as! MedicineVCCell
        
        
        if indexPath.section == 0{
            if serching && indexPath.section == 0 {
                cell.lblCategory.text = serchCategory[indexPath.row]
            }
            else{
                cell.lblCategory.text = medicineName[indexPath.row]
            }
            return cell
        }
        else{
            medicineCell.lblHeading.text = typeMedicine[indexPath.row]
            medicineCell.imageMedicine.image = UIImage(named: medicineImage[indexPath.row])
            medicineCell.lblMedicineName.text = nameMedicine[indexPath.row]
            medicineCell.lblName.text = wightmedicine[indexPath.row]
            medicineCell.lblPrice.text = priceMedicine[indexPath.row]
            return medicineCell
        }
        
    }
    
    //MARK: - collectionview flowlayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            let label = UILabel(frame: CGRect.zero)
            label.text = medicineName[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width + 20, height: 50)
        }
        else{
            let width =  self.colletionView.frame.width  / 2
            return . init(width: width, height: 220)
        }
        
    }
    
    //MARK: - collectionview selected
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PharmacyVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - collectionview heading
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! CollectionViewHeader
        
        header.lblTitle.text = "Category"
        header.lblTitle.textAlignment = .left
        return header
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return .init(width: 90, height: 30)
        }
        else{
            return .zero
        }
    }
    
    //MARK: - scanButton
    
    
    @IBAction func scanBtnAction(_ sender: UIButton) {
        let vc = UploadVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - searchbar

extension SerchVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        serchCategory = medicineName.filter({ $0.uppercased().prefix(searchText.count)  == searchText.uppercased()})
        serching = true
        self.colletionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.serchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.serchBar.resignFirstResponder()
    }
}
