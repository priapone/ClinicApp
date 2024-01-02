//
//  MedicineVCCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 22/07/22.
//

import UIKit

class MedicineVCCell: UICollectionViewCell {

    @IBOutlet var medicineView: UIView!
    @IBOutlet var lblHeading: UILabel!
    @IBOutlet var imageMedicine: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblMedicineName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        medicineView.dropShadow()
    }

}
