//
//  InofrmationVCCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class InofrmationVCCell: UITableViewCell {

    @IBOutlet var informationView: UIView!
    @IBOutlet var lblSubTotal: UILabel!
    @IBOutlet var lblTotal: UILabel!
    @IBOutlet var lblDeliveryfee: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var tapOnPlus:(()->())? = nil
    var onTapMinus:((Int)->())? = nil
    
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
