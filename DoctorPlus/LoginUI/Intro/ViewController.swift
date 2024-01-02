//
//  ViewController.swift
//  test2
//
//  Created by Keyur Baravaliya on 12/07/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    

    @IBOutlet var Mycollectionview: UICollectionView!
    @IBOutlet var Buttonnext: UIButton!
    @IBOutlet var Buttonskip: UIButton!
    
    
    var Slider: [OnbordingSlide] = []
    
    var currentpage = 0{
        didSet{
            if currentpage == Slider.count - 1{
                Buttonnext.setTitle("Sign in", for: .normal)
                Buttonskip.isHidden = true
            }
            else{
                Buttonnext.setTitle("Next", for: .normal)
                Buttonskip.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Slider = [
            OnbordingSlide(title: "Find the best doctor in your vicinity", descripition: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit blandit id consectetur laoreet. Dui, aliquam id ipsum ut nunc. Est sed odio turpis", image: UIImage(named: "Health")!),
            OnbordingSlide(title: "Emergency Services", descripition:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit blandit id consectetur laoreet. Dui, aliquam id ipsum ut nunc. Est sed odio turpis", image: UIImage(named: "Ambulance")!),
            OnbordingSlide(title: "Get  your medicine instantly", descripition: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit blandit id consectetur laoreet. Dui, aliquam id ipsum ut nunc. Est sed odio turpis", image: UIImage(named: "Medicine")!)
        ]
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK: - collectionview constraint
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath)  as! MyCollectionViewCell
        cell.setup(Slider[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentpage = Int(scrollView.contentOffset.x / width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.Mycollectionview.frame.width
        let height = self.Mycollectionview.frame.height
        return .init(width: width, height: height)
    }
    
    //MARK: - Skipbutton
    
    @IBAction func Skipbutton(_ sender: UIButton) {
        Mycollectionview.isPagingEnabled = false
        let index = IndexPath(item: Slider.count - 1, section: 0)
        Mycollectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        currentpage = Slider.count - 1
        Mycollectionview.isPagingEnabled = true
    }
 
    
    //MARK: - 
    @IBAction func Nextbutton(sender: UIButton) {
        if currentpage == Slider.count - 1{
            let vc = LoginVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            Mycollectionview.isPagingEnabled = false
            currentpage += 1
            let index = IndexPath(item: currentpage , section: 0)
            Mycollectionview.scrollToItem(at: index , at: .centeredHorizontally  , animated: true)
            Mycollectionview.isPagingEnabled = true
        }
    }
}

