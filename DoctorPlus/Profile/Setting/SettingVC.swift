//
//  SettingVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
        }
    }
    var Setting : [ProfileDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Setting"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        Setting = [
                    ProfileDetails(image: UIImage(named: "h")!, title: "Change Password"),
                    ProfileDetails(image: UIImage(named: "i")!, title: "Term and Condition"),
                    ProfileDetails(image: UIImage(named: "k")!, title: "Help")
                 ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for:     indexPath) as! SettingCell
        settingCell.setupSetting(Setting[indexPath.row])
        return settingCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = ChangePasswordVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1{
            let vc = TermConditionVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
            let vc = HelpVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
