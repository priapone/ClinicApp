//
//  AddPillsVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit
import DropDown

class AddPillsVC: UIViewController, UITextFieldDelegate{

    @IBOutlet var reminderTxt: UITextField!
    @IBOutlet var timeTxt: UITextField!
    @IBOutlet var dropTxt: UITextField!
    @IBOutlet var doseTxt: UITextField!
    @IBOutlet var nameTxt: UITextField!
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var dropBtn: UIButton!
    
    let dropdown = DropDown()
    let daysArray = ["1 day","2 day","3 day","4 day"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.TitleLebal.text = "Add your pills"
        
        reminderTxt.delegate = self
        timeTxt.delegate = self
        dropTxt.delegate = self
        doseTxt.delegate = self
        nameTxt.delegate = self
        
        timeTxt.delegate = self
        dropTxt.delegate = self
        doseTxt.delegate = self
        nameTxt.delegate = self
        reminderTxt.delegate = self
        
        //MARK: -  dropDown menu
        
        dropdown.anchorView = dropTxt
        dropdown.dataSource = daysArray
        dropdown.direction = .bottom
        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.dropTxt.text = daysArray[index]
        }
    }
   
     func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
     func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeShadow()
    }
    
    
    func clickOnPlus(){
        let timepicker = UIDatePicker()
        timepicker.datePickerMode = .time
        timepicker.preferredDatePickerStyle = .wheels
        timeTxt.inputView = timepicker
    }
    
    func clickOnReminder(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        reminderTxt.inputView = datePicker
    }
    
  
    
    @IBAction func plusBtnAction(_ sender: UIButton) {
       clickOnPlus()
    }
    
    @IBAction func reminderBtnAction(_ sender: UIButton) {
       clickOnReminder()
    }
    
    @IBAction func dropBtnAction(_ sender: UIButton) {
        dropdown.show()
    }
    
    
    
    
}
