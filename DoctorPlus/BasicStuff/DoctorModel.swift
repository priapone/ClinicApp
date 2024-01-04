//
//  DoctorModel.swift
//  DoctorPlus
//
//  Created by Programmatore on 03/01/24.
//

import Foundation
import FirebaseStorage
import FirebaseStorageUI
import FirebaseFirestore

struct DoctorModel: Codable {
    @DocumentID var ID: String?
    var Address: String = ""
    var Image: String = ""
    var Name: String = ""
    var Surname: String = ""
    var Specialist : String = ""
    var FiscalCode: String
    var City: String
    var CV: String = ""
    var MorningSlot = [String()]
    var AfternoonSlot = [String()]
    var EveningSlot = [String()]
    
    init(ID: String? = nil, address: String? = nil, image: String? = nil, name: String, surname: String? = nil, specialist: String? = nil, fiscalcode: String? = nil, city: String? = nil, cv: String? = nil, morningSlot: [String] = [String()], afternoonSlot: [String] = [String()], eveningSlot: [String] = [String()]) {
        self.ID = ID
        self.Address = address ?? ""
        self.Image = image ?? ""
        self.Name = name
        self.Surname = surname ?? ""
        self.Specialist = specialist ?? ""
        self.FiscalCode = fiscalcode ?? ""
        self.City = city ?? ""
        self.CV = cv ?? ""
        self.MorningSlot = morningSlot
        self.AfternoonSlot = afternoonSlot
        self.EveningSlot = eveningSlot
    }
    
}

struct DoctorModelWithImage {
    
    var dm: DoctorModel
    var doctorImage: UIImage
    
    init(dm: DoctorModel, doctorImage: UIImage) {
        self.dm = dm
        self.doctorImage = doctorImage
    }
}
