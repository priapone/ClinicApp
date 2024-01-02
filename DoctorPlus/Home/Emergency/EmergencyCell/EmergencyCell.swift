//
//  EmergencyCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class EmergencyCell: UICollectionViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imageForamublance: UIImageView!
    @IBOutlet var lblDecription: UILabel!
    
    
    func setups(_ slide : Emergencydetail){
        imageForamublance.image = slide.image
        lblTitle.text = slide.title
        lblDecription.text = slide.subttitle
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
