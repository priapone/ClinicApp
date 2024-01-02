//
//  DoctorLeftCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 29/07/22.
//

import UIKit

class DoctorLeftCell: UITableViewCell {

    @IBOutlet var lblSpecialist: UILabel!
    @IBOutlet var lblNameDoctor: UILabel!
    @IBOutlet var imageDoctor: UIImageView!
    @IBOutlet var colorView: UIView!
    @IBOutlet var lblView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblView.addShadow()
        colorView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
