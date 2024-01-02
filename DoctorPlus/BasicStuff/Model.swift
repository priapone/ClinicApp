//
//  File.swift
//  test2
//
//  Created by Keyur Baravaliya on 27/07/22.
//

import Foundation
import UIKit

struct OnbordingSlide {
    var title:String
    var descripition:String
    var image: UIImage
}

struct cartDetails {
    
    var image : UIImage
    var title : String
    var Descripition : String
    var price : Double
    var qty : Int
}

struct cartTotal{
    
    var subtotal : Double
    var delieveryfee : Double
    var total : Double
}

struct cart {
    var image : UIImage
    var title : String
    var Descripition : String
    var price : Double
}

struct DoctorDetail{
    var image : UIImage
    var name : String
    var specilist : String
}

struct Emergencydetail{
    var image: UIImage
    var title: String
    var subttitle:String
}

struct NotificationDetails{
    var title:String
    var Description:String
    var time:String
}

struct Leftmessage{
    var messge:String
    var time: String
}
 
struct ProfileDetails{
    var image: UIImage
    var title: String
}



