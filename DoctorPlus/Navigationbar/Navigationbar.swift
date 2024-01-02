//
//  Navigationbar.swift
//  test2
//
//  Created by Keyur Baravaliya on 20/07/22.
//

import UIKit

class Navigationbar: UIView {

    @IBOutlet var contenetview: UIView!
    @IBOutlet var TitleLebal: UILabel!
    @IBOutlet var backbutton: UIButton!
    
    var onTapBackAction:(()->())? = nil
    
    @IBAction func ButtonClick(_ sender: UIButton) {
        if let getAct = self.onTapBackAction {
            getAct()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CommitInt()
    }
    
    required init!(coder: NSCoder) {
        super.init(coder: coder)
        CommitInt()
    }

    func CommitInt(){
        Bundle.main.loadNibNamed("Navigationbar", owner: self, options: nil)
        addSubview(contenetview)
        contenetview.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
