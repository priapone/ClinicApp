//
//  UserModel.swift
//  DoctorPlus
//
//  Created by Programmatore on 05/01/24.
//

import Foundation
import FirebaseStorage
import FirebaseStorageUI
import FirebaseFirestore

struct UserModel: Codable {
    @DocumentID var ID: String?
    var address: String
    var cap: String
    var city: String
    var displayName: String
    var email: String
    var fiscalcode: String
    
    init(ID: String? = nil, address: String? = "", cap: String? = "", city: String? = "", displayName: String, email: String? = "", fiscalcode: String? = "" ) {
        self.ID = ID
        self.address = address!
        self.cap = cap!
        self.city = city!
        self.displayName = displayName
        self.email = email!
        self.fiscalcode = fiscalcode!
    }
    
}

struct Medicine: Codable {
    var name: String
    var start: Date
    var end: Date
    var repetitions: Int
    var image: String
    
    init(name: String? = "", start: Date? = Date(), end: Date? = Date(), repetitions: Int? = 1, image: String? = "10") {
        self.name = name!
        self.start = start!
        self.end = end!
        self.repetitions = repetitions!
        self.image = image!
    }
}





