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
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        requestAuthForLocalNotifications()
        Thread.sleep(forTimeInterval: 2.0)
        
        FirebaseApp.configure()
        
        Task {
            await queryDb()
        }
        
        IQKeyboardManager.shared.enable = true
        // Ask permission for notifications
        
    
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UIApplication.shared.applicationIconBadgeNumber = 0
        print("sono in application")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {

        if #available(iOS 16.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(0)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.applicationIconBadgeNumber = 0
            print("sono in WillResignActive")
        }
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
        print("sono in DidBecomeActive")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        print("Sono in SceneDidBecomeActive")
    }

    func queryDb () async {
        let db = Firestore.firestore()
        do {
          let querySnapshot = try await db.collection("UserData/v7B9zuo3FLcq91PSUpwEjImxBXa2/MedicineData").getDocuments()
          for document in querySnapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        
        do {
          let querySnapshot = try await db.collection("UserData").whereField("email", isEqualTo: "a@b.it")
            .getDocuments()
          for document in querySnapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        
    }
    
    func requestAuthForLocalNotifications(){
        notificationCenter.delegate = self
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has declined notification")
            }
        }
    }


    

}

