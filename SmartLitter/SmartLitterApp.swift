//
//  SmartLitterApp.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI

@main
struct SmartLitterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            SignInView()
//            MainView()
        }
    }
}
