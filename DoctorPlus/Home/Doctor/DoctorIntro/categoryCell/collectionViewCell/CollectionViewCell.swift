//
//  CollectionViewCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var collectionView: UIView!
    @IBOutlet var lblDoctorCategory: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.addShadow()
        
    }

}
