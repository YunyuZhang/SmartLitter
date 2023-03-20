//
//  HistoryView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI
import UserNotifications

struct HistoryView: View {
    @State private var dates: Set<DateComponents> = []
    @State private var showFilters = false
    
    @ObservedObject private var historyViewModel = HistoryViewModel()
    var logList = [
        Log(timestamp: "3/17/2022 10:00pm", catName: "Cat1", activity: "Poop"),
        Log(timestamp: "3/17/2022 9:00pm", catName: "Cat1", activity: "Pee"),
        Log(timestamp: "3/17/2022 8:00pm", catName: "Cat1", activity: "Poop"),
        Log(timestamp: "3/17/2022 7:00pm", catName: "Cat1", activity: "Poop"),
        Log(timestamp: "3/16/2022 5:00am", catName: "Cat1", activity: "Pee")]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Usage History")
                        .padding(20)
                    
                    Button(action: {
                        self.showFilters.toggle()
                    }) {
                        Text("Show/Hide Filters")
                    }
                    
                    if showFilters {
                        VStack {
                            MultiDatePicker("Dates Filter", selection: $dates)
                                
                            
                            Button("Usage") {
                                generateNotification(title: "PurrfectTracker", subtitle: "Box Usage", body: "Cat 1 just pooped", time: 3.0)
                                
                            }
                            .frame(width:70, height: 20)
                            
                            Button("Alert") {
                                generateNotification(title: "PurrfectTracker", subtitle: "ALERT", body: "Cat 1 just pooped 3 times within 6 hours!", time: 3.5)
                            }
                            .frame(width:70, height: 20)
                            
                            Button("Summary") {
                                generateNotification(title: "PurrfectTracker", subtitle: "Summary", body: "Cat 1 pooped 7 times, peed 10 times and gain 2 lbs last week", time: 4.0)
                            }
                            .frame(width:70, height: 20)
                        }.padding(4)
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Summary")
                            .bold()
                        Text("Cat 1")
                        HStack {
                            Text("pooped")
                            Text("3")
                                .foregroundColor(.orange)
                            Text("times")
                        }
                        HStack {
                            Text("peed")
                            Text("2")
                                .foregroundColor(.orange)
                            Text("times")
                        }
                        Text("within 24 hours")
                    }
                    

                    List {
                        ForEach(historyViewModel.logList, id: \.id) {
                            log in
                            LogView(log:log)
                        }
                    }
                    .frame(width: 300,
                           height: 500,
                           alignment: .leading)
                }
            }
            .padding()
        }
        .onAppear() {
            historyViewModel.generateLogs()
        }
    }
    
    func generateNotification(title: String, subtitle: String, body: String, time: Double) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request){ (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

