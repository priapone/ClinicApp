//
//  ProfileVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 02/08/22.
//

import UIKit
import StoreKit
import Firebase

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var labelProfileName: UILabel!
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var ProfileView: UIView!
    @IBOutlet var tableView: UITableView!
    
    var profile : [ProfileDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Profile"
        navigationView.backbutton.isHidden = true
        
        ProfileView.layer.cornerRadius = 20
        ProfileView.addShadow()
       
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            loadDisplayName(uid, label: labelProfileName)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        profile = [
                    ProfileDetails(image: UIImage(named: "a")!, title: "Edit Profile"),
                    ProfileDetails(image: UIImage(named: "b")!, title: "Notification"),
                    ProfileDetails(image: UIImage(named: "c")!, title: "Setting"),
                    ProfileDetails(image: UIImage(named: "d")!, title: "My appointment"),
                    ProfileDetails(image: UIImage(named: "e")!, title: "Medical document"),
                    ProfileDetails(image: UIImage(named: "f")!, title: "Feedback"),
                    ProfileDetails(image: UIImage(named: "g")!, title: "Logout")
                ]
    }
    
    
    //MARK: - tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        profileCell.setupProfile(profile[indexPath.row])
        return profileCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = EditProfileVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1{
            let vc = NotificationSettingVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
           let vc = SettingVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 3{
            let vc = MyAppointmentVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 4{
            let vc = MedicalDocumentVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 5 {
            
            guard let scene = view.window?.windowScene else{
                return
            }
            SKStoreReviewController.requestReview(in: scene)
            
//            let vc = FeedbackVC()
//            vc.modalPresentationStyle = .overCurrentContext
//            present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 6{
            let vc = LogoutVC()
            vc.modalPresentationStyle = .overCurrentContext
            vc.ontapLogOutBtn = {
                self.navigateToLogin()
            }
            present(vc, animated: true, completion: nil)
        }
    }

}
