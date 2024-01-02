//
//  cellForDoctorCategory.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class cellForDoctorCategory: UICollectionViewCell {

    @IBOutlet var lblView: UIView!
    @IBOutlet var lblNameOfCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblView.layer.cornerRadius = 15
        lblView.clipsToBounds = true
    }
    

}
