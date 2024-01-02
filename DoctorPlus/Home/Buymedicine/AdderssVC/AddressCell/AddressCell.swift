//
//  AddressCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet var addressView: UIView!
    @IBOutlet var lblHome: UILabel!
    @IBOutlet var lblArea: UILabel!
    @IBOutlet var imageSelect: UIImageView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addressView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    var onTapEdit:(()->())? = nil
    
    @IBAction func editBtnAction(_ sender: UIButton) {
        if let getAct = self.onTapEdit{
            getAct()
        }
    }
    
}
