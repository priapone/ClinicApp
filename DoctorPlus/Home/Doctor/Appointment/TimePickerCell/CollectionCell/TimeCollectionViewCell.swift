//
//  TimeCollectionViewCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit


class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var collectionView: UIView!
    @IBOutlet var txtTime: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dropShadow()
    }

}
