//
//  ClinicViewCell.swift
//  DoctorPlus
//
//  Created by Programmatore on 31/12/23.
//

import UIKit
import CoreLocation

class ClinicViewCell: UICollectionViewCell {

    @IBOutlet weak var imagehospital: UIImageView!
    let clinicLocation = CLLocationCoordinate2D(latitude: 45.488616843450856, longitude: 12.151485767698716)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonOpenMaps(_ sender: UIButton) {
        let url = URL(string: "http://maps.apple.com/maps?saddr=&daddr=\(clinicLocation.latitude),\(clinicLocation.longitude)")
        UIApplication.shared.open(url!)
    }
}
