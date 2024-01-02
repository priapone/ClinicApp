//
//  DatePickerCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class DatePickerCell: UITableViewCell {

    @IBOutlet var datepickerView: UIDatePicker!
    @IBOutlet var dateView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }
    
}
