//
//  UploadVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 26/07/22.
//

import UIKit

class UploadVC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var addBtn: UIButton!
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBtn.isHidden = true
        navigationView.TitleLebal.text = "Upload prescription"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func plusBtnAction(_ sender: UIButton) {
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate  = self
        imagecontroller.sourceType = .photoLibrary
        imagecontroller.isEditing = true
        self.present(imagecontroller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage{
            imageView.image = image
            addBtn.isHidden = false
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtnAction(_ sender: UIButton) {
        let vc = MedicineVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
