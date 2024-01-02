//
//  ProfileCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet var imageOfProfile: UIImageView!
    @IBOutlet var lblEdit: UILabel!
    
    func setupProfile(_ Profile: ProfileDetails){
        imageOfProfile.image = Profile.image
        lblEdit.text = Profile.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
    }
}
