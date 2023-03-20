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
        
        self.logList = [Log(timestamp: "3/17/2022 10:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/17/2022 8:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/17/2022 7:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/16/2022 6:00pm", catName: "Cat2", activity: "Pee"),
                        Log(timestamp: "3/16/2022 5:00am", catName: "Cat2", activity: "Pee")]
        
        print(self.logList)
    }
    
    
}

struct Log: Identifiable {
    let id = UUID()
    var timestamp = ""
    var catName = ""
    var activity = ""
}

