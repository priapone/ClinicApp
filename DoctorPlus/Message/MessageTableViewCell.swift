//
//  MessageTableViewCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 21/07/22.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet var doctorImage: UIImageView!
    @IBOutlet var lbldoctorName: UILabel!
    @IBOutlet var lblDiscription: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
