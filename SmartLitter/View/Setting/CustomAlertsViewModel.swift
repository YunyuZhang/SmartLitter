//
//  CustomAlertsViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 4/22/23.
//

import Foundation
import SwiftUI


class CustomAlertsViewModel: ObservableObject {
    @Published var allCustomAlerts: [CustomAlert] = []
    
    init() {
        // Initialize the custom alerts array with some sample data
        allCustomAlerts = [
            CustomAlert(name: "Alert 1", eventType: "poop", comparator: "more than" ,numberOfTimes: 2, timePeriod: 4, toggleOn: true),
            CustomAlert(name: "Alert 2", eventType: "pee", comparator: "within" ,numberOfTimes: 8, timePeriod: 8, toggleOn: true)
        ]
    }
}

struct CustomAlert: Identifiable {
    let id = UUID()
    let name: String
    let eventType: String
    let comparator: String
    let numberOfTimes: Int
    let timePeriod: Int
    var toggleOn: Bool
    
    init(name: String, eventType: String, comparator: String, numberOfTimes: Int, timePeriod: Int, toggleOn: Bool) {
        self.name = name
        self.eventType = eventType
        self.comparator = comparator
        self.numberOfTimes = numberOfTimes
        self.timePeriod = timePeriod
        self.toggleOn = toggleOn
    }
    
    func getAlertContent() -> String {
        return "\(self.name): when \(self.eventType) \(self.numberOfTimes) times \(self.comparator) \(self.timePeriod) hours"
    }
    
}

