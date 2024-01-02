//
//  MyAppointmentCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class MyAppointmentCell: UITableViewCell {

    @IBOutlet var myView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myView.layer.cornerRadius = 10
        myView.layer.borderColor = UIColor.gray.cgColor
        myView.layer.borderWidth = 0.2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
