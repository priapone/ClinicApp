//
//  MyCollectionViewCell.swift
//  test2
//
//  Created by Keyur Baravaliya on 13/07/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var Mylabel: UILabel!
    @IBOutlet var Secondlabel: UILabel!
    @IBOutlet var Image: UIImageView!
    
    func setup(_ slide : OnbordingSlide){
        Image.image = slide.image
        Mylabel.text = slide.title
        Secondlabel.text = slide.descripition
    }
    
    
}
