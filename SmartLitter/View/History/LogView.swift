//
//  LogView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI

struct LogView: View {
    var log: UsageLog
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(log.catName)
                    .foregroundColor(.blue)
                
                Text(log.eventType)
                    .foregroundColor(.orange)
            }
            Text(log.timestamp)
        }
        .foregroundColor(.primary)
        .font(.system(size: 20, weight: .semibold, design: .rounded))
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        let logList : [UsageLog] = [UsageLog(timestamp: "3/17/2022 10:00pm", catName: "Cat1", eventType: "Poop"),
                        UsageLog(timestamp: "3/17/2022 8:00pm", catName: "Cat1", eventType: "Poop"),
                        UsageLog(timestamp: "3/17/2022 7:00pm", catName: "Cat1", eventType: "Poop"),
                        UsageLog(timestamp: "3/16/2022 6:00pm", catName: "Cat2", eventType: "Pee"),
                        UsageLog(timestamp: "3/16/2022 5:00am", catName: "Cat2", eventType: "Pee")]
        
        ForEach(logList) {
            log in
            LogView(log : log)
        }
        
    }
}
