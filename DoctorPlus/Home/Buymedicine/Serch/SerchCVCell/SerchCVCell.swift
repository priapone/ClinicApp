//
//  SerchCVCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 22/07/22.
//

import UIKit

class SerchCVCell: UICollectionViewCell {

    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var lblview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblview.dropShadow()
    }

}
