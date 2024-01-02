//
//  MedicineVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 27/07/22.
//

import UIKit

class MedicineVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "MedicineCell", bundle: nil), forCellReuseIdentifier: "MedicineCell")
        }
    }
    
    var Details : [cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationView.TitleLebal.text = "Your Medicine"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        tableView.delegate = self
        tableView.dataSource = self
        cartProductInit()
    }

    
    func cartProductInit() {
        Details.append(cart(image: UIImage(named: "Rectangle 84")!, title: "Vitamin  B-Complex", Descripition: "15 tablate in strip", price: 11.50))
        Details.append(cart(image: UIImage(named: "Rectangle 84")!, title: "Vitamin  B-Complex", Descripition: "15 tablate in strip", price: 15.50))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell", for: indexPath) as! MedicineCell
        cell.setup(Details[indexPath.row])
        return cell
    }
    
    @IBAction func continueBtnAction(_ sender: UIButton) {
        let vc = CartVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
