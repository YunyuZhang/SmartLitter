//
//  HistoryViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI
import UIKit

final class HistoryViewModel : ObservableObject {
    
    @Published var logList : [Log] = []
    
    func generateLogs() {
        
        self.logList = [
            Log(timestamp: "3/17/2022 10:00pm", catName: "Haybe", activity: "Poop"),
            Log(timestamp: "3/17/2022 9:00pm", catName: "Haybe", activity: "Pee"),
            Log(timestamp: "3/17/2022 8:00pm", catName: "Haybe", activity: "Poop"),
            Log(timestamp: "3/17/2022 7:00pm", catName: "Haybe", activity: "Poop"),
            Log(timestamp: "3/16/2022 5:00am", catName: "Haybe", activity: "Pee")
        ]
        
    }
    
    
}

struct Log: Identifiable {
    let id = UUID()
    var timestamp = ""
    var catName = ""
    var activity = ""
}

