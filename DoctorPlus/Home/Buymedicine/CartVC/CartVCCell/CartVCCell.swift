//
//  CartVCCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 25/07/22.
//

import UIKit

class CartVCCell: UITableViewCell {

    @IBOutlet var cartView: UIView!
    @IBOutlet var imageMedicine: UIImageView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblNameOfMedicine: UILabel!
    @IBOutlet var lblQty: UILabel!
    @IBOutlet var minuesBtn: UIButton!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var removeBtn: UIButton!
    @IBOutlet var lblDescription: UILabel!
    
    
    
    var onTapPlus:((Double)->())? = nil
    var onTapMinus:((Double)->())? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cartView.clipsToBounds = true
        cartView.dropShadow()
    }

    override func prepareForReuse() {
//        self.lblQty.text = ""
//        self.lblPrice.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - plus button action
    
    @IBAction func plusBtnAction(_ sender: UIButton) {
        let qtyInt = Int(self.lblQty.text ?? "1") ?? 1
        
        if let getAct = self.onTapPlus {
            getAct(Double(qtyInt))
        }
    }
    //MARK: - minues button action

    @IBAction func minuesBTnAction(_ sender: UIButton) {
        let qtyInt = Int(self.lblQty.text ?? "1") ?? 1
        
        if let getAct = self.onTapMinus {
            getAct(Double(qtyInt))
        }
    }
}
