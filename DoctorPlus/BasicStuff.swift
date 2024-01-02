//
//  BasicStuff.swift
//  test2
//
//  Created by Keyur Baravaliya on 12/07/22.
//

import Foundation
import UIKit
import Firebase



extension UIButton {
    func setCornerRadius(_ radius:Int = 10) {
        self.layer.cornerRadius = CGFloat(radius)
    }
}

func isIphoneX() -> Bool {
    if( UIDevice.current.userInterfaceIdiom == .phone) {
        if(UIScreen.main.bounds.size.height >= 812) {
            return true
        }
    }
    return false
}


 // MARK: - Alert
extension UIViewController{
    
    func EmailPasswordalert(){
        let alert = UIAlertController(title: "Alert", message: "Emailid and Password Wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Emailalert(){
        let alert = UIAlertController(title: "Alert", message: "Enter Valid Email id", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Phonealert(){
        let alert = UIAlertController(title: "Alert", message: "Enter 10 Digit number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Passwordalert(){
        let alert = UIAlertController(title: "Alert", message: "Enter Valid Password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Emptyalert(){
        let alert = UIAlertController(title: "Alert", message: "Please fill All details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func Passwordmatch(){
        let alert = UIAlertController(title: "Alert", message: "Password and Conformpassword is not match", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
        present(alert, animated: true, completion: nil)
}
    
    
    
    // MARK: - Navigationbar
    
    func setNavigtionbar(_ Title: String = "" ){
        self.navigationController?.navigationBar.isHidden = false
        title = Title
        let backbutton = UIBarButtonItem(title: "", style: .plain , target: self, action: #selector(popnav))
        backbutton.setBackgroundImage(UIImage(named: "action bar"), for: .normal , barMetrics: .default)
        self.navigationItem.setLeftBarButton(backbutton, animated: true)
     }
    @objc func popnav() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Keyboardhide
    
    func hidekeyboardtapArround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisskeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisskeyboard(){
        view.endEditing(true)
    }
    
    func loadDisplayName(_ uid: String, label: UILabel)  {
        
        let db = Firestore.firestore()
        db.collection("UserData").document(uid)
          .addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
              print("Error fetching document: \(error!)")
              return
            }
            guard let data = document.data() else {
              print("Document data was empty.")
              return
            }
            print("Current data: \(data)")
              if let displayName = data["displayName"] as? String {
                  label.text = displayName
              }
              else {
                  print("No display name registered")
              }
            
          }
        
        
    }
}


// MARK: - texfiled shadow

extension UITextField {
    func addShadowToTextField(color: UIColor = UIColor.gray, cornerRadius: CGFloat) {
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.Mycolor().cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.7
        self.layer.cornerRadius = cornerRadius
        
   }
    func removeShadow(backgroundColor : UIColor = .systemGray6){
        self.backgroundColor = backgroundColor
        self.layer.shadowOpacity = 0
    }
}


extension UIButton {
    func addShadowToButton(color: UIColor = UIColor.gray, cornerRadius: CGFloat) {
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.Mycolor().cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = cornerRadius
   }
}

extension UIColor{

    class func hexColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func Mycolor()-> UIColor{
        return  #colorLiteral(red: 0.02352941176, green: 0.568627451, blue: 0.6156862745, alpha: 1)
    }

}






// MARK: - Validation

extension String{
    func IsValidphone() -> Bool {
        let phoneRegEx = "[0-9]{10}"
        return applyPredictOnRange(regRgx: phoneRegEx)
    }
    func IsvalidPassword()->Bool{
//        let passwordRgx = "[A-Z]{1,2}+[a-z]{3,9}+[@&$]{1}+[0-9]{1,4}"
//        return applyPredictOnRange(regRgx: passwordRgx)
        return true
    }
    func IsvalidEmailid()->Bool{
        let emailrgx = "[A-Za-z0-9_%+-]+@[A-Za-z0-9._]+\\.[A-Za-z]{2,}"
        return applyPredictOnRange(regRgx: emailrgx)
    }
    func applyPredictOnRange(regRgx : String)->Bool {
        let trimmerstring = self.trimmingCharacters(in: .whitespaces)
        let phonetest = NSPredicate(format: "SELF MATCHES %@", regRgx)
        let invalidstring = phonetest.evaluate(with:trimmerstring)
        return invalidstring
    }
}


// MARK: - extension of shadow

extension UIView {
   
        func shadow(shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat) {
            layer.shadowOffset = shadowOffset
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
            layer.masksToBounds = false
            clipsToBounds = false
        }
        
        func buttonShadow() {
            
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
        
        func tabShadow() {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.layer.shadowOpacity = 0.8
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
        
        
    func addShadow(_ color:CGColor = UIColor.gray.cgColor) {
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOpacity = 0.6
            layer.shadowRadius = 4
            layer.masksToBounds = true
            layer.cornerRadius = 15
            clipsToBounds = false
        }
        
        func addLightShadow(_ color:CGColor = UIColor.lightGray.cgColor) {
            layer.shadowOffset = CGSize(width: 0, height: 0)
            layer.shadowColor = color
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 8
            layer.masksToBounds = false
            clipsToBounds = false
        }
        
        func makeTopCornerRound(_ cornerRadius:Double = 20) {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        func makeBottomCornerRound(_ cornerRadius:Double = 20) {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
       
    
    func dropShadow(_ borderWidth : Double = 0.4 , borderColor : UIColor = .lightGray){
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.4
        layer.cornerRadius = 10
    }
    
    func addDashedBorder() {
        
        
      let shapeLayer:CAShapeLayer = CAShapeLayer()
      let frameSize = self.frame.size
      let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
      shapeLayer.bounds = shapeRect
      shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
      shapeLayer.fillColor = UIColor.clear.cgColor
      shapeLayer.strokeColor = UIColor.Mycolor().cgColor
      shapeLayer.lineWidth = 2
      shapeLayer.lineJoin = CAShapeLayerLineJoin.round
      shapeLayer.lineDashPattern = [6,3]
      shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

      self.layer.addSublayer(shapeLayer)
      }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}


extension UIViewController {
//    func navigateToHome() {
//
//        let frontViewController = TabBarScreen()
//        let frontNavigationController = UINavigationController(rootViewController: frontViewController)
//        frontNavigationController.setNavigationBarHidden(true, animated: false)
//        self.view.window?.rootViewController = frontNavigationController
//    }

    func navigateToLogin() {

        let frontViewController = LoginVC()
        let frontNavigationController = UINavigationController(rootViewController: frontViewController)
        frontNavigationController.setNavigationBarHidden(true, animated: false)
        self.view.window?.rootViewController = frontNavigationController
    }
//    var notchHeight:CGFloat {
//        let window = UIApplication.shared.windows[0]
//        return window.safeAreaInsets.top
//        let bottomPadding = window.safeAreaInsets.bottom
//    }
}

// MARK: - round uiview

@IBDesignable
class RoundUIView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
