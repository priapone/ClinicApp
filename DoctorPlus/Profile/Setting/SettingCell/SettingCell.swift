//
//  SettingCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet var imagforSetting: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var settingView: UIView!
    
    
    func setupSetting(_ Profile: ProfileDetails){
        imagforSetting.image = Profile.image
        lblTitle.text = Profile.title
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        settingView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
