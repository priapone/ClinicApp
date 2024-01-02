//
//  EmergencyVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 01/08/22.
//

import UIKit

class EmergencyVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet var navigationView: Navigationbar!
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "EmergencyCell", bundle: nil), forCellWithReuseIdentifier: "EmergencyCell")
        }
    }
    var slider: [Emergencydetail] = []
    var currentpage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - navigation lbl
        let fullString = NSMutableAttributedString(string: "  ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "0")
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: "  Emergency"))
        self.navigationView.TitleLebal.attributedText = fullString
        navigationView.TitleLebal.textColor =  UIColor.hexColor(hex: "EF1717")
        navigationView.onTapBackAction = {
            self.navigationController?.popViewController(animated: true)
        }
        
        slider = [ Emergencydetail(image: UIImage(named: "ambulance")!, title: "Call ambulance", subttitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Condimentum quam tempus lectus eu non aliquam sit. Ipsum etiam vitae ut pellentesque interdum "),
                   Emergencydetail(image: UIImage(named: "ambulance")!, title: "Getting the Nearest ambulance for You.", subttitle: "")]
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let emergencyCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "EmergencyCell", for: indexPath) as! EmergencyCell
        emergencyCell.setups(slider[indexPath.row])
        return emergencyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return.init(width: width, height: height)
    }
  
    @IBAction func callambulanceBtnAction(_ sender: UIButton) {
        let vc = LocationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
