//
//  MessaegVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 21/07/22.
//

import UIKit

class MessaegVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var viewNavBar: Navigationbar!
    @IBOutlet var tabelView: UITableView!
    
    var doctorImage = ["Ellipse 1-1","Ellipse 19-1","Ellipse 19-2","Ellipse 19-3","Ellipse 19-4","Ellipse 19-5","Ellipse 19-6","Ellipse 19-7","Ellipse 19-8","Ellipse 19-9","Ellipse 19-10","Ellipse 19-11","Ellipse 19-12","Ellipse 19-13","Ellipse 19-14","Ellipse 19-15","Ellipse 19-16","Ellipse 19-17","Ellipse 19-18","Ellipse 19-19"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewNavBar.backbutton.isHidden = true
        viewNavBar.TitleLebal.text = "Message"
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! MessageTableViewCell
        cell.doctorImage.image = UIImage(named: doctorImage[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
