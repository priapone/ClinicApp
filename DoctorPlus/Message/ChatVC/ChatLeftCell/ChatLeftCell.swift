//
//  ChatLeftCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class ChatLeftCell: UITableViewCell {

    @IBOutlet var lblMessage: UILabel!
    @IBOutlet var chatView: UIView!
    @IBOutlet var leftmessageView: UIView!
    @IBOutlet var lblTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftmessageView.layer.cornerRadius = 10
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
