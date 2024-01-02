//
//  MyAppointmentVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit

class MyAppointmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "MyAppointmentCell", bundle: nil), forCellReuseIdentifier: "MyAppointmentCell")
        }
    }
    @IBOutlet var navigationView: Navigationbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationView.TitleLebal.text = "My appointment"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated:  true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentCell", for: indexPath) as! MyAppointmentCell
        return cell
    }
    

}
