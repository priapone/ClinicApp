//
//  CardCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var imageSelect: UIImageView!
    @IBOutlet var lblCardNumber: UILabel!
    @IBOutlet var lblName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.dropShadow(0.7)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
