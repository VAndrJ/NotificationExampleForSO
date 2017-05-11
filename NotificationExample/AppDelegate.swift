//
//  AppDelegate.swift
//  NotificationExample
//
//  Created by VAndrJ on 5/11/17.
//  Copyright © 2017 VAndrJ. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let requestIdentifier = "SampleRequest"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            //Do something if needed
        }
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "Sample"
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier:requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request){(error) in
            if (error != nil){
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [requestIdentifier])
    }
}
