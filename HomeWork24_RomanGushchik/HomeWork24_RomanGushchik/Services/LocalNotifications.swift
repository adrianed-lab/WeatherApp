//
//  LocalNotification.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 10.07.22.
//

import Foundation
import UIKit
import UserNotifications

protocol NotificationProtocol {
    func createLocalNotification(valueWeather: [Hourly])
    func removeNotification(withIdentifiers identifiers: [String])
}
class UserNotification: NotificationProtocol {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func removeNotification(withIdentifiers identifiers: [String]) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func createLocalNotification(valueWeather: [Hourly]) {
        removeNotification(withIdentifiers: ["Check notification"])
        guard let mainWeather = valueWeather.first?.weather.first?.main else {return}
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { permissionGranted, error in
            if !permissionGranted {
                    print("Permission Denied")
            }
        }
        notificationCenter.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                if mainWeather == .rain || mainWeather == .thunderstorm || mainWeather == .snow {
                let content = UNMutableNotificationContent()
                content.title = "Weather Local Notification"
                content.body = "Check weather"
                content.sound = UNNotificationSound.default
                let identifier = "Check notification"
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1800, repeats: false)
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    self.notificationCenter.add(request) { error in
                    print(error?.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    
    

