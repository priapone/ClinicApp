//
//  ChatRightCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class ChatRightCell: UITableViewCell {

    @IBOutlet var lblRightmessage: UILabel!
    @IBOutlet var rightMessageView: UIView!
    
    @IBOutlet var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        rightMessageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
