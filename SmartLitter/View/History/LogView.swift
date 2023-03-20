//
//  LogView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI

struct LogView: View {
    var log: Log
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(log.catName)
                    .foregroundColor(.blue)
                
                Text(log.activity)
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
        let logList : [Log] = [Log(timestamp: "3/17/2022 10:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/17/2022 8:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/17/2022 7:00pm", catName: "Cat1", activity: "Poop"),
                        Log(timestamp: "3/16/2022 6:00pm", catName: "Cat2", activity: "Pee"),
                        Log(timestamp: "3/16/2022 5:00am", catName: "Cat2", activity: "Pee")]
        
        ForEach(logList) {
            log in
            LogView(log : log)
        }
        
    }
}
