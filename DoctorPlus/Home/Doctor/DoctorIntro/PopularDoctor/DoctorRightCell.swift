//
//  DoctorRightCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class DoctorRightCell: UITableViewCell {

    @IBOutlet var lblDoctorName: UILabel!
    @IBOutlet var lblSpecilist: UILabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet var lblView: UIView!
    @IBOutlet var imageOfDoctor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        colorView.layer.cornerRadius = 10
        lblView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
