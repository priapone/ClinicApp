//
//  FeedbackVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 04/08/22.
//

import UIKit

class FeedbackVC: UIViewController {

   
    @IBOutlet var feedbackView: UIView!
    @IBOutlet var imageOkk: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        feedbackView.layer.cornerRadius = 10
        feedbackView.addLightShadow()
    }

    @IBAction func notnowBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
