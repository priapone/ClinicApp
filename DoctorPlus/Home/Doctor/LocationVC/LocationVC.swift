//
//  LocationVC.swift
//  test2
//
//  Created by Keyur Baravaliya on 30/07/22.
//

import CoreLocation
import UIKit
import MapKit

class LocationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var CollView: UIView!
    var image = ["96","96","96"]
    let locationManager = CLLocationManager()
    let clinicLocation = CLLocationCoordinate2D(latitude: 45.488616843450856, longitude: 12.151485767698716)
    var locationStart = CLLocationCoordinate2D()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "ClinicViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ClinicViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //CollView.addLightShadow()
        //locationManager.startUpdatingLocation()
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
    
        
        //MARK: - location set
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 45.52334188227785, longitude: 12.092969228316898)
//        annotation.title = "Samarpan Hospital"
//        mapView.addAnnotation(annotation)
//        
//        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//        mapView.setRegion(region, animated: true)
        render(CLLocation(latitude: 45.52334188227785, longitude: 12.092969228316898))
        
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ClinicViewCell", for: indexPath) as! ClinicViewCell
        cell.imagehospital.image = UIImage(named: image[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width
        let height = self.collectionView.frame.height
        return .init(width: width, height: height)
    }
    
    func render (_ location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        annotation.title = "Ambulatorio Spinea"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
            request.requestsAlternateRoutes = true
            request.transportType = .automobile

            let directions = MKDirections(request: request)

            directions.calculate { [unowned self] response, error in
                guard let unwrappedResponse = response else { return }
                
                //for getting just one route
                if let route = unwrappedResponse.routes.first {
                    //show on map
                    self.mapView.addOverlay(route.polyline)
                    //set the map area to show the route
                    self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets.init(top: 80.0, left: 20.0, bottom: 100.0, right: 20.0), animated: true)
                }

                //if you want to show multiple routes then you can get all routes in a loop in the following statement
                //for route in unwrappedResponse.routes {}
            }
        }


    @IBAction func buttonOpenMaps(_ sender: UIButton) {
        let url = URL(string: "http://maps.apple.com/maps?saddr=&daddr=\(clinicLocation.latitude),\(clinicLocation.longitude)")
        UIApplication.shared.open(url!)
    }
    

}

extension LocationVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         let renderer = MKPolylineRenderer(overlay: overlay)
         renderer.strokeColor = UIColor.red
         renderer.lineWidth = 5.0
         return renderer
    }
    
}

extension LocationVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Coordinate: \(lat), \(lon)")
            locationStart = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            showRouteOnMap(pickupCoordinate: locationStart, destinationCoordinate: clinicLocation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

