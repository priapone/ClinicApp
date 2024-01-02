//
//  EditProfileVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 03/08/22.
//

import UIKit
import DropDown

class EditProfileVC: UIViewController , UITextFieldDelegate {

    
    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var genderTxt: UITextField!
    @IBOutlet var nametxt: UITextField!
    @IBOutlet var loctiontxt: UITextField!
    @IBOutlet var emailidTxt: UITextField!
    @IBOutlet var phoneTxt: UITextField!
    
    let dropDown = DropDown()
    let genderArray = ["Male","Female"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.TitleLebal.text = "Profile"
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        imageProfile.layer.cornerRadius = 70
        
        genderTxt.delegate = self
        nametxt.delegate = self
        loctiontxt.delegate = self
        emailidTxt.delegate = self
        phoneTxt.delegate = self
        
        
        dropDown.anchorView = genderTxt
        dropDown.direction = .bottom
        dropDown.dataSource = genderArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.genderTxt.text = genderArray[index]
        }
        
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
       textField.addShadowToTextField(cornerRadius: 5)
   }
    func textFieldDidEndEditing(_ textField: UITextField) {
       textField.removeShadow()
   }
    
    @IBAction func changeBtnAction(_ sender: UIButton) {
        alertImagePicker()
    }
    
    @IBAction func dropBtnAction(_ sender: UIButton) {
        dropDown.show()
    }
    
}


//MARK: - imagepick from Gallery , camera

extension EditProfileVC : UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    func showImagePickerController(_ sourcetype: UIImagePickerController.SourceType){
        let imageController = UIImagePickerController()
        imageController.sourceType = sourcetype
        imageController.delegate = self
        imageController.allowsEditing = true
        present(imageController, animated: true, completion: nil)
    }
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            imageProfile.image = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageProfile.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func alertImagePicker(){
        let action = UIAlertController(title: "Select Image", message: "Selected image From", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) { _ in
            self.showImagePickerController(.camera)
        }
        let liberyBtn = UIAlertAction(title: "Library", style: .default) { _ in
            self.showImagePickerController(.photoLibrary)
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        action.addAction(cameraBtn)
        action.addAction(liberyBtn)
        action.addAction(cancelBtn)
        present(action, animated: true, completion: nil)
    }
}
