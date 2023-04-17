//
//  HistoryViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI
import UIKit

final class HistoryViewModel : ObservableObject {
    
    @Published var logList : [UsageLog] = []
    
    func generateLogs() {
        
        self.logList = [
            UsageLog(timestamp: "3/17/2022 10:00pm", catName: "Haybe", eventType: "Poop"),
            UsageLog(timestamp: "3/17/2022 9:00pm", catName: "Haybe", eventType: "Pee"),
            UsageLog(timestamp: "3/17/2022 8:00pm", catName: "Haybe", eventType: "Poop"),
            UsageLog(timestamp: "3/17/2022 7:00pm", catName: "Haybe", eventType: "Poop"),
            UsageLog(timestamp: "3/16/2022 5:00am", catName: "Haybe", eventType: "Pee")
        ]
        
    }
    
    func getUsageWithAPI() {
        self.logList = []
        guard let url = URL(string: "http://localhost:8080/getUsage?userID=yunyuzhang11") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Process the data as needed
            let jsonString = String(data: data, encoding: .utf8)!
            print("++++ Data received: \(jsonString)")
            
            DispatchQueue.main.async {
                        self.parseJson(jsonString: jsonString)
                
            }
            
        }

        task.resume()
    }

    func parseJson(jsonString: String) {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Invalid JSON data")
            return
        }
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
            let responseBody = jsonObject["response_body"] as! [String: Any]
            
            for (key, value) in responseBody {
                let event = value as! [String: Any]
                let catName = event["catName"] as! String
                let eventType = event["eventType"] as! String
                let timestamp = event["timestamp"] as! String
//                print("\(key): \(catName) did \(eventType) at \(timestamp)")
                let newLog = UsageLog(timestamp: timestamp, catName: catName, eventType: eventType)
                self.logList.append(newLog)
            }
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
        }
    }
    
    
}

struct UsageLog: Identifiable {
    let id = UUID()
    var timestamp = ""
    var catName = ""
    var eventType = ""
}

