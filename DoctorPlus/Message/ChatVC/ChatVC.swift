//
//  ChatVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var chatVIew: UIView!
    @IBOutlet var txtChat: UITextField!
    
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "ChatLeftCell", bundle: nil), forCellReuseIdentifier: "ChatLeftCell")
            tableView.register(UINib(nibName: "ChatRightCell", bundle: nil), forCellReuseIdentifier: "ChatRightCell")
            tableView.register(UINib(nibName: "ImageLeftCell", bundle: nil), forCellReuseIdentifier: "ImageLeftCell")
        }
    }
    var detailofLeftMessage : [Leftmessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtChat.dropShadow(borderColor: .Mycolor())
        
        navigationView.TitleLebal.text = "Dr.Rudra Shah"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func messagecell(){
        detailofLeftMessage = [ Leftmessage(messge: "Hey ,How Are You?", time: "1.30 pm"),
                                Leftmessage(messge: "Hi, I am Great Thanks!", time: "1.30 am"),
                                Leftmessage(messge: "Lorem ipsum dolor sit amet, consectetur ", time: "1.35 pm"),
                                Leftmessage(messge: "Lorem ipsum dolor sitamet consectetur", time: "1.45 am"),
                              ]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        
        if indexPath.row == 0 || indexPath.row == 2{
            let leftMessageCell = tableView.dequeueReusableCell(withIdentifier: "ChatLeftCell", for: indexPath) as! ChatLeftCell
            return leftMessageCell
        }
        else if indexPath.row == 1 || indexPath.row == 3 {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "ChatRightCell", for: indexPath) as! ChatRightCell
            return rightCell
        }
        else{
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageLeftCell", for: indexPath) as! ImageLeftCell
            return imageCell
        }
        
    }
    
    @IBAction func sendBtnAction(_ sender: UIButton) {
        
    }
}
