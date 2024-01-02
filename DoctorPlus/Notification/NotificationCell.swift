//
//  NotificationCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    func Setup(_ slide : NotificationDetails){
        lblTitle.text = slide.title
        lblDescription.text = slide.Description
        lblTime.text = slide.time
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
