//
//  HistoryView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI

struct HistoryView: View {
    @State private var dates: Set<DateComponents> = []
    @State private var showFilters = false
    
    @ObservedObject private var historyViewModel = HistoryViewModel()
    var logList = [Log(timestamp: "3/17/2022 10:00pm", catName: "Cat1", activity: "Poop"),
                   Log(timestamp: "3/17/2022 8:00pm", catName: "Cat1", activity: "Poop"),
                   Log(timestamp: "3/17/2022 7:00pm", catName: "Cat1", activity: "Poop"),
                   Log(timestamp: "3/16/2022 6:00pm", catName: "Cat2", activity: "Pee"),
                   Log(timestamp: "3/16/2022 5:00am", catName: "Cat2", activity: "Pee")]
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        NavigationView {
                VStack {
                    Text("Usage History")
                        .padding(20)
                    
                    Button(action: {
                        self.showFilters.toggle()
                    }) {
                        Text("Show/Hide Filters")
                            .padding()
                    }
                    
                    if showFilters {
                        SegmentedControlView(options: ["Cat 1", "Cat 2"], selected: "Cat 1")
                        MultiDatePicker("Dates Available", selection: $dates)
                            .fixedSize()
                    }

                    List {
                        ForEach(self.logList, id: \.id) {
                            log in
                            LogView(log:log)
                        }
                    }
                    
                    
                }
//                .font(.system(size: 20, weight: .light, design: .rounded))
        }
        .onAppear() {
            historyViewModel.generateLogs()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

