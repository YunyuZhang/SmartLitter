//
//  WeightInfoView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI
import Charts

struct WeightInfoView: View {
    struct weight: Identifiable {
            let id = UUID()
            let weekday: Date
            let weight: Int
            
            init(day: String, weight: Int) {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMdd"
                self.weekday = formatter.date(from: day) ?? Date.distantPast
                self.weight = weight
            }
        }
    
    let weightHistory: [weight] = [
        weight(day: "20211001", weight: 6),
        weight(day: "20211101", weight: 12),
        weight(day: "20211201", weight: 13),
        weight(day: "20220201", weight: 13),
        weight(day: "20220301", weight: 18)
    ]
        
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Weight History")
                        .padding(20)
                    Image("haybe_profile")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                    
                    SegmentedControlView(options: ["1w", "1m", "6m", "1y"], selected: "1m")
                    
                    Chart {
                        RectangleMark(
                            xStart: nil,
                            xEnd: nil,
                            yStart: .value("Max Weight", 9),
                            yEnd: .value("Min Weight", 17)
                        )
                        .foregroundStyle(.green)
                        .opacity(0.5)
                        
                        ForEach(weightHistory) {
                            LineMark(
                                x: .value("Week Day", $0.weekday, unit: .day),
                                y: .value("weight", $0.weight)
                            )
                        }
                        .lineStyle(.init(lineWidth: 5))
                        .foregroundStyle(.orange.gradient)
                        .symbol(Circle())
                    }
                    .padding()
                    .frame(width: 350, height: 200)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Haybe's curret weight is 18 Lbs")
                        Text("Haybe is a little chunky")
                    }
                    .font(.system(size: 20, weight: .light, design: .rounded))
                }
            }
        }
        
    }
}

struct WeightInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeightInfoView()
    }
}
