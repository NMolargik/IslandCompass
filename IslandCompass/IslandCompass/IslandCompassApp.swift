//
//  IslandCompassApp.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import SwiftUI
import Foundation

@main
struct IslandCompassAppApp: App {
    
    let center = UNUserNotificationCenter.current()
    
    init() {
        registerForNotification()
    }
    
    func registerForNotification() {
        UIApplication.shared.registerForRemoteNotifications()
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {

            }
        })
    }
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.1, *) {
                ContentView()
            }
        }
    }
}
