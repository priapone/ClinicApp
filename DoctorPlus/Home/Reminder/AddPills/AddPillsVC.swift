//
//  AddPillsVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit
import DropDown
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class AddPillsVC: UIViewController, UITextFieldDelegate{

    @IBOutlet var reminderTxt: UITextField!
    @IBOutlet var timeTxt: UITextField!
    @IBOutlet var dropTxt: UITextField!
    @IBOutlet var doseTxt: UITextField!
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var dropBtn: UIButton!
    let db = Firestore.firestore()
    var name: String = ""
    var startDate: Date = Date()
    var realStartDate: Date = Date()
    var endDate: Date = Date()
    var dose: Int = 1
    var startHour: Int = 0
    var startMinute: Int = 0
    var daysToEnd: Int = 1
    var dateComponents = DateComponents()
    let dropdown = DropDown()
    var daysArray = ["1 giorno"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        navigationView.TitleLebal.text = "Aggiungi pastiglie"
        dateComponents.hour = 0
        dateComponents.minute = 0
        realStartDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: realStartDate)!
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
        createDaysArray()
        dropdown.anchorView = dropTxt
        dropdown.dataSource = daysArray
        dropdown.direction = .bottom
        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.dropTxt.text = daysArray[index]
            daysToEnd = index + 1
            dateComponents.day = daysToEnd
            endDate = Calendar.current.date(byAdding: dateComponents, to: realStartDate)!
        }
    }
   
     func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addShadowToTextField(cornerRadius: 5)
    }
     func textFieldDidEndEditing(_ textField: UITextField) {
        name = textField.text ?? ""
        textField.removeShadow()
    }
    
    func clickOnPlus(){
        let timePicker = UIDatePicker()
        timePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
        timePicker.locale = Locale.init(identifier: "en_gb")
        if #available(iOS 14, *) {
            timePicker.preferredDatePickerStyle = .inline
            timePicker.sizeToFit()
        }
        timePicker.minuteInterval = 10
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.sizeToFit()
        timeTxt.inputView = timePicker
    }
    
    func clickOnReminder(){
        let datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200))
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .inline
            datePicker.sizeToFit()
        }
        datePicker.datePickerMode = .date
        //pickerView.addSubview(datePicker)
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
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        startDate = sender.date
        realStartDate = Calendar.current.date(bySettingHour: startHour + 1, minute: startMinute, second: 0, of: startDate)!
        dateComponents.day = daysToEnd
        endDate = Calendar.current.date(byAdding: dateComponents, to: realStartDate)!
        print("Date Changed: \(startHour):\(startMinute), realStartDate: \(realStartDate), endDate: \(endDate)")
        var strDay: String
        var strMonth: String
        if let day = components.day, let month = components.month, let year = components.year {
            if day < 10 { strDay = "0\(day)"}
            else { strDay = String(day) }
            if month < 10 { strMonth = "0\(month)"}
            else { strMonth = String(month) }
            print("\(strDay) \(strMonth) \(year)")
            reminderTxt.text = "\(strDay)/\(strMonth)/\(year)"
        }
    }
    
    @objc func timeChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: sender.date)
        if let hour = components.hour, let minute = components.minute {
            startHour = hour
            startMinute = minute
            realStartDate = Calendar.current.date(bySettingHour: hour + 1, minute: minute, second: 0, of: realStartDate)!
            dateComponents.day = daysToEnd
            endDate = Calendar.current.date(byAdding: dateComponents, to: realStartDate)!
            var strMinute: String
            if minute == 0 {
                strMinute = "00"
            }
            else {
                strMinute = String(minute)
            }
            print("Time Changed: \(startHour):\(startMinute), Start: \(realStartDate), End: \(endDate)")
            timeTxt.text = "\(hour):\(strMinute)"
        }
    }
    
    func createDaysArray () {
        for a in 2...31 {
            daysArray.append("\(a) giorni")
        }
        daysArray.append("per sempre")
    }
    
    
    @IBAction func buttonAddPills(_ sender: UIButton) {
        if let user = Auth.auth().currentUser {
            let id = user.uid
            print ("Name: \(String(describing: nameTxt.text)), Dose: \(dose), Start: \(realStartDate), End: \(endDate)")
//            Task
//            {
//              await registerPills(userId: id, name: name, dose: dose, start: startDate, end: endDate)
//            }
        }

    }
    
    func registerPills (userId: String, name: String, dose: Int, start: Date, end: Date) async {
        do {
            try await db.collection("UserData/\(userId)/MedicineData").addDocument(data: ["end": end, "image": 10, "name": name, "repetitions": dose, "start": start])
        }
        catch {
            print ("Error saving data")
        }
    }
    
    
}
