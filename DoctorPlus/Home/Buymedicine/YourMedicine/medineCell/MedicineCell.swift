//
//  MedicineCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 27/07/22.
//

import UIKit

class MedicineCell: UITableViewCell {

    @IBOutlet var cartView: UIView!
    @IBOutlet var imageProduct: UIImageView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblNameOfMedicine: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var removeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartView.addLightShadow()
    }

    func setup( _ Deatil : cart){
        imageProduct.image = Deatil.image
        lblNameOfMedicine.text = Deatil.title
        lblDescription.text = Deatil.Descripition
        lblPrice.text = "$ \(Deatil.price)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
