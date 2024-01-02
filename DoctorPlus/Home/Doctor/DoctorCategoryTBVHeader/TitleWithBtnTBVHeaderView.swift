//
//  TitleWithBtnTBVHeaderView.swift
//  test2
//
//  Created by Keyur Baravaliya on 30/07/22.
//

import UIKit

class TitleWithBtnTBVHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnSeeall: UIButton!
    
    var OntapSeeall:(()->())? = nil
    
    @IBAction func BtnActionSeeall(_ sender: UIButton) {
        if let getAct = self.OntapSeeall {
            getAct()
        }
    }
    
}
