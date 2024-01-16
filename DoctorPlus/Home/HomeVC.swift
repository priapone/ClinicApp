//
//  HomeVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 18/07/22.
//

import UIKit
import FSPagerView
import Firebase
import CoreLocation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,FSPagerViewDelegate,FSPagerViewDataSource, UNUserNotificationCenterDelegate {
    

    @IBOutlet weak var labelPosition: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet var fsPagerView: UIView!
    @IBOutlet var mapView: UIView!
    @IBOutlet var serchbtnClick: UIButton!
    @IBOutlet var serchbar: UISearchBar!
    @IBOutlet var homecollectionView: UICollectionView!
    @IBOutlet var pageControlView: FSPageControl!{
        didSet {
            self.pageControlView.numberOfPages = self.pageviewimage.count
        }
    }
   
    @IBOutlet var pagerview: FSPagerView! {
        didSet {
        self.pagerview.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    var Itemimage = ["Group","Stethoscope","Regime","Ambulance_2"]
    var Itemlabel = ["Buy Medicine","Doctor","Set Reminder","Emergency"]
    var itemColor = ["EDF0F7","E8EDEE","FDEFEF","F7EDF1"]
    var pageviewimage = ["FsImage","67","68"]
    let locationManager = CLLocationManager()
    var doctors = [DoctorModelWithImage(dm: DoctorModel(name: ""), doctorImage: UIImage(named: "placeholder.jpg")!)]
    var users = [UserModel(displayName: "")]
    var medicines = [Medicine()]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addShadow()

        if let user = Auth.auth().currentUser {
            let uid = user.uid
            loadDisplayName(uid, label: labelName)
            Task {
                await doAsyncWork(userEmail: user.email!)
            }
        }
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
        
        //MARK: - pagerview
        
        pagerview.dataSource = self
        pagerview.delegate = self
        pagerview.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(pagerview)
        pagerview.transformer = FSPagerViewTransformer(type: .overlap)
        pagerview.automaticSlidingInterval = 3.0
        
        
    
        //MARK: - pagecontrol
        
        pageControlView.numberOfPages = pageviewimage.count
        pageControlView.currentPage = 0
        pageControlView.setFillColor(.systemGray6, for: .normal)
        pageControlView.setFillColor(.Mycolor(), for: .selected)

        

    }
    
    //MARK: - pagerview datasource
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return pageviewimage.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerview.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: pageviewimage[index])
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControlView.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView){
        self.pageControlView.currentPage = pagerView.currentIndex
    }
    
    //MARK: - collectionciew datasource and delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Itemimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!  Homecell
        cell.Image.image =  UIImage(named: Itemimage[indexPath.row])
        cell.label.text = Itemlabel[indexPath.row]
        cell.layer.cornerRadius  = 10
        
        if  indexPath.row == 0{
            cell.backgroundColor = .hexColor(hex: "EDF0F7")
            cell.label.textColor = .hexColor(hex: "4F80F2")
        }
        else if indexPath.row == 1 {
            cell.backgroundColor = .hexColor(hex: "E8EDEE")
            cell.label.textColor = .hexColor(hex: "06919D")
        }
        else if indexPath.row == 2{
            cell.backgroundColor = .hexColor(hex: "FDEFEF")
            cell.label.textColor = .hexColor(hex: "B96C6C")
        }
        else{
            cell.backgroundColor = .hexColor(hex: "F7EDF1")
            cell.label.textColor = .hexColor(hex: "9D6279")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 20)/2
        let height = (collectionView.frame.height - 10)/2.2
        return .init(width: size , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = SerchVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1{
            let vc = DoctorVC()
            vc.doctors = self.doctors
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
            let vc = ReminderVC()
            // Update data about medicine
            vc.medicines.removeAll()
            vc.medicines = medicines
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = EmergencyVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK: - serchbtn click

    @available(iOS 16.0, *)
    @IBAction func serchBtn(_ sender: UIButton) {
        let vc = SerchVC()
        vc.getNavigationTitle = "Search"
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    

    @IBAction func mapBtnAction(_ sender: UIButton) {
        let vc = LocationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
    func retrieveCityName(latitude: Double, longitude: Double, completionHandler: @escaping (String?) -> Void)
    {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), completionHandler:
        {
            placeMarks, error in

            completionHandler(placeMarks?.first?.locality)
         })
    }
    

    
    
    func doAsyncWork(userEmail: String) async {
        print("Doing async work")
        let uiItemOfImage = UIImageView()
        let urlImage = "gs://ambulatorio-spinea.appspot.com"
        let placeholderImage = UIImage(named: "placeholder.jpg")
        var doctor: DoctorModel
        var user: UserModel = UserModel(displayName: "")
        var medicine: Medicine
        let db = Firestore.firestore()
        let storage = Storage.storage()
        doctors.removeAll()
        do {
            let querySnapshot = try await db.collection("DoctorData").getDocuments()
            for document in querySnapshot.documents {
              do {
                  // self.doctor is DoctorModel type, so it has an Image field
                  doctor = try document.data(as: DoctorModel.self)
                  let gsReference = storage.reference(forURL: "\(urlImage)/\(doctor.Image)")
                  try await uiItemOfImage.sd_setImage(with: gsReference, placeholderImage: placeholderImage)
                  doctors.append(DoctorModelWithImage(dm: doctor, doctorImage: uiItemOfImage.image!))
                  print("\(doctors)")
              }
              catch {
                  print(error)
              }
              
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        users.removeAll()
        do {
          let querySnapshot = try await db.collection("UserData").whereField("email", isEqualTo: userEmail)
            .getDocuments()
          for document in querySnapshot.documents {
            print("HomeVC User: \(document.documentID) => \(document.data())")
            do {
                user = try document.data(as: UserModel.self)
                users.append(user)
              }
          }
            print ("Users: \(users)")
        } catch {
          print("Error getting documents: \(error)")
        }
        medicines.removeAll()
        do {
            let querySnapshot = try await db.collection("UserData/\(String(describing: user.ID!))/MedicineData").getDocuments()
          let actualDate = Date()
          for document in querySnapshot.documents {
            print("HomeVC Medicine: \(document.documentID) => \(document.data())")
            do {
                medicine = try document.data(as: Medicine.self)
                if actualDate > medicine.start && actualDate < medicine.end {
                    print("Insert \(medicine.name)")
                    medicines.append(medicine)
                }
                
              }
          }
            print ("Medicine: \(medicines)")
        } catch {
          print("Error getting documents: \(error)")
        }
        
        
        
    }
}

extension HomeVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Coordinate: \(lat), \(lon)")
            retrieveCityName(latitude: lat, longitude: lon) { city in
                self.labelPosition.text = city
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


