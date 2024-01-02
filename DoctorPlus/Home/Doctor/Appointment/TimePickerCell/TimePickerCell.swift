//
//  TimePickerCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class TimePickerCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    @IBOutlet var timeView: UIView!
    
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
            collectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
            collectionView.register(UINib(nibName: "CollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")

        }
    }

    var morningSlot = ["10.10 AM","10.30 AM","10.50 AM","11.20 AM","11.50 AM"]
    var afternoonSlot = ["2.00 PM","02.30 PM","02.40 PM"]
    var eveningSlot = ["7.00 PM","07.30 PM","07.40 PM","8.00 PM","8.40 PM"]

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return morningSlot.count
        }
        else if section == 1{
            return afternoonSlot.count
        }
        else{
            return eveningSlot.count
        }
    }

    
    //MARK: - collectionview flow layout
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
        
        if indexPath.section == 0{
            cell.txtTime.text = morningSlot[indexPath.row]
            return cell
        }
        else if indexPath.section == 1{
            cell.txtTime.text = afternoonSlot[indexPath.row]
            return cell
        }
        else{
            cell.txtTime.text = eveningSlot[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.collectionView.frame.width - 10) / 3
        return CGSize(width: width , height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let timeCell = self.collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        timeCell.txtTime.backgroundColor = UIColor.Mycolor()
        timeCell.txtTime.textColor = .white
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let timeCell = self.collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        timeCell.txtTime.backgroundColor = .white
        timeCell.txtTime.textColor = .black
    }
    
    //MARK: - collectionView header
    
    func  collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! CollectionViewHeader
        
        if indexPath.section == 0{
            headerView.lblTitle.text = "Programma della mattina"
            return headerView
        }
        else if indexPath.section == 1{
            headerView.lblTitle.text = "Programma del pomeriggio"
            return headerView
        }
        else{
            headerView.lblTitle.text = "Programma della sera"
            return headerView
        }
    }
}
