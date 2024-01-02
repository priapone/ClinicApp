//
//  ReminderViewCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class ReminderViewCell: UITableViewCell {

    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblMedicineName: UILabel!
    @IBOutlet var ImageForMedicine: UIImageView!
    @IBOutlet var myView: UIView!
    @IBOutlet var vectorBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myView.dropShadow()
        myView.layer.cornerRadius = 10
        vectorBtn.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
