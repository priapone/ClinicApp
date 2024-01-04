//
//  AppDelegate.swift
//  test2
//
//  Created by Keyur Baravaliya on 12/07/22.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var doctor: DoctorModel = DoctorModel(name: "")
    var doctors = [DoctorModel(name: "")]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Thread.sleep(forTimeInterval: 2.0)
        FirebaseApp.configure()
        
        // Load doctors' data
        
        Task {
            await doAsyncWork()
        }
        IQKeyboardManager.shared.enable = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func doAsyncWork() async {
        print("Doing async work")
        let db = Firestore.firestore()
        doctors.removeAll()
        do {
          let querySnapshot = try await db.collection("DoctorData").getDocuments()
          for document in querySnapshot.documents {
              do {
                  self.doctor = try document.data(as: DoctorModel.self)
                  doctors.append(self.doctor)
                  print("\(doctors)")
              }
              catch {
                  print(error)
              }
              
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        
    }


    

}

