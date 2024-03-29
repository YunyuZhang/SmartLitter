//
//  AppDelegate.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseMessaging
import GoogleSignIn



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let gcmMessageIDKey = "gcm.Message_ID"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // request for the permission for notification
          let center = UNUserNotificationCenter.current()
          center.delegate = self
          center.getNotificationSettings(completionHandler: { settings in
            if settings.authorizationStatus == .authorized  {
                print("permission granted")
            }
         })
        
        FirebaseApp.configure()
        
        
        // for Firebase notification

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        center.requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()
        
        // Messaging
        Messaging.messaging().delegate = self
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        
        // Google login
        GoogleSigninSetup()

        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        var handled: Bool

        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }

        // Handle other custom URL types.

        // If not handled by this app, return false.
        return false
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func GoogleSigninSetup() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
                print("not logged in")
            } else {
                // Show the app's signed-in state.
                print("Resotred logged in: \(user?.profile?.name ?? "")")
                Globals.shared.gUser = user!
            }
        }
    }

}


extension AppDelegate: UNUserNotificationCenterDelegate {
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // ...

    // Print full message.
    print(userInfo)

    // Change this to your preferred presentation option
    return [[.alert, .sound]]
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse) async {
    let userInfo = response.notification.request.content.userInfo

    // ...

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print full message.
    print(userInfo)
  }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
      -> UIBackgroundFetchResult {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      return UIBackgroundFetchResult.newData
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            print("Yay! Got a device token \(deviceToken)")
            Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
        }

}



extension AppDelegate : MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")
      
      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
}

