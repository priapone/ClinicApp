//
//  PaymentCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class PaymentCell: UITableViewCell {

    @IBOutlet var paymentView: UIView!
    @IBOutlet var imageCard: UIImageView!
    @IBOutlet var imageSelect: UIImageView!
    @IBOutlet var lblCardName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        paymentView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
