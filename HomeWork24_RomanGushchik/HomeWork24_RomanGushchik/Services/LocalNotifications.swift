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
            if settings.authorizationStatus == .authorized && mainWeather == .rain || mainWeather == .thunderstorm || mainWeather == .snow {
                let content = UNMutableNotificationContent()
                    content.title = "WeatherNotification".localizable()
                    content.body = "Check weather".localizable()
                content.sound = UNNotificationSound.default
                let identifier = "Check notification"
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1800, repeats: false)
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    self.notificationCenter.add(request) { error in
                        guard let error = error else {return}
                    print(error.localizedDescription)
                        }
                    }
                }
            }
    }
    
    

