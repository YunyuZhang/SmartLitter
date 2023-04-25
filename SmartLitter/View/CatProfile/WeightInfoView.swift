
import SwiftUI
import Charts

struct WeightInfoView: View {

    let allWeightHistory: [Weight] = [
        Weight(day: "20220324", weight: 3),
        Weight(day: "20220326", weight: 3),
        Weight(day: "20220401", weight: 4),
        Weight(day: "20220501", weight: 5),
        Weight(day: "20220601", weight: 7),
        Weight(day: "20220701", weight: 7),
        Weight(day: "20220801", weight: 8),
        Weight(day: "20220901", weight: 9),
        Weight(day: "20221001", weight: 10),
        Weight(day: "20221101", weight: 12),
        Weight(day: "20221201", weight: 12),
        Weight(day: "20230101", weight: 13),
        Weight(day: "20230201", weight: 13.5),
        Weight(day: "20230301", weight: 14),
        Weight(day: "20230401", weight: 14),
        Weight(day: "20230410", weight: 14.5),
        Weight(day: "20230415", weight: 16),
        Weight(day: "20230420", weight: 17),
        Weight(day: "20230425", weight: 19)
    ]

    
    @State private var selectedOption = "1m"
    let options = ["1w", "1m", "6m", "1y"]
    @State private var selectedTimeIndex = 3
    
    @State var filteredWeightHistory: [Weight] = []
        
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    PageHeaderView(title: "Weight History")
                        .padding(20)
                    Image("haybe_profile")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                    
                    Text("18 lbs")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                    
                    Picker("", selection: $selectedTimeIndex) {
                                    ForEach(0..<options.count) { index in
                                        Text(options[index]).tag(index)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: selectedTimeIndex) { _ in
                            filteredWeightHistory = getFilteredWeightHistory(timeRange: options[selectedTimeIndex])
                        }
                
                    
                    Chart {
                        RectangleMark(
                            xStart: nil,
                            xEnd: nil,
                            yStart: .value("Min Weight", 9),
                            yEnd: .value("Max Weight", 17)
                        )
                        .foregroundStyle(.green)
                        .opacity(0.5)
                        
                        ForEach(filteredWeightHistory, id: \.id) {
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
                        Text("The healthy weight range for Haybe is 9 - 17 lbs")
                        Text("Haybe is a little chunky")
                    }
                    .padding()
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                }
            }
        }
        .onAppear {
            filteredWeightHistory = getFilteredWeightHistory(timeRange: options[selectedTimeIndex])
        }
    }
    
    private func getFilteredWeightHistory(timeRange: String) -> [Weight] {
        
        switch timeRange {
        case "1w":
            return allWeightHistory.filter { $0.weekday > Date().addingTimeInterval(-7*24*60*60) }
        case "1m":
            return allWeightHistory.filter { $0.weekday > Date().addingTimeInterval(-30*24*60*60) }
        case "6m":
            return allWeightHistory.filter { $0.weekday > Date().addingTimeInterval(-180*24*60*60) }
        case "1y":
            return allWeightHistory.filter { $0.weekday > Date().addingTimeInterval(-365*24*60*60) }
        default:
            return allWeightHistory
        }
    }
}

struct Weight: Identifiable {
    let id = UUID()
    let weekday: Date
    let weight: Double
    
    init(day: String, weight: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.weight = weight
    }
}

