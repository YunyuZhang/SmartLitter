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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    PageHeaderView(title: "Usage History")
                        .padding(20)
                    Divider()
                    VStack(alignment: .center) {
                        Text("Summary")
                            .bold()
                        Text("Haybe")
                        HStack {
                            VStack {
                                Text("pooped")
                                Text("3")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                Text("times")
                            }
                            Divider()
                            VStack {
                                Text("peed")
                                Text("2")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                Text("times")
                            }
                            
                        }
                        Text("within 24 hours")
                    }
                    
                    Button(action: {
                        self.showFilters.toggle()
                    }) {
                        Text("Date Filter")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .padding()
                    }
                    
                    if showFilters {
                        VStack {
                            MultiDatePicker("Dates Filter", selection: $dates)
                                
                            
//                            Button("Usage") {
//                                generateNotification(title: "PurrfectTracker", subtitle: "Box Usage", body: "Haybe just pooped", time: 3.0)
//
//                            }
//                            .frame(width:70, height: 20)
//
//                            Button("Alert") {
//                                generateNotification(title: "PurrfectTracker", subtitle: "ALERT", body: "Haybe just pooped 3 times within 6 hours!", time: 3.5)
//                            }
//                            .frame(width:70, height: 20)
//
//                            Button("Summary") {
//                                generateNotification(title: "PurrfectTracker", subtitle: "Weekly Summary", body: "Haybe pooped 7 times, peed 10 times and gained 2 lbs last week", time: 3.0)
//                            }
//                            .frame(width:70, height: 20)
                        }.padding(4)
                    }
                    

//                    List {
//                        ForEach(historyViewModel.getSortedLogList(), id: \.id) {
//                            log in
//                            LogView(log:log)
//                        }
//                    }
                    Group {
                        ForEach(historyViewModel.getSortedLogList(), id: \.id) {
                            log in
                            Divider()
                            LogView(log:log)
                            Divider()
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear() {
//            historyViewModel.generateLogs()
            historyViewModel.getUsageWithAPI()
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

