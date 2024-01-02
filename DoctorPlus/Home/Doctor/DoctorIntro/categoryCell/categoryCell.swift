//
//  categoryCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class categoryCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    


    @IBOutlet var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        }
    }
    
    var doctoryCategory = ["General Doctor","Child Doctor","Skin Doctor","Child Doctor","Aurveda","Dentist","Homeopathic","Nephrology"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.collectionView.setNeedsLayout()
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctoryCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.lblDoctorCategory.text = doctoryCategory[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = doctoryCategory[indexPath.item]
        label.sizeToFit()
        let height = self.collectionView.frame.height
        return CGSize(width: label.frame.width + 70, height: height)
    }
    
}
