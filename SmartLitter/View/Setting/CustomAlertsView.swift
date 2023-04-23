//
//  CustomAlertsView.swift
//  SmartLitter
//
//  Created by Forrest on 3/20/23.
//

import SwiftUI
import UIKit


struct CustomAlertsView: View {
    
    
    
    @State private var eventType: String = "Poop"
    @State private var comparator: String = "More than"
    @State private var numberOfTime: String = ""
    @State private var hour: String = ""
    
    @ObservedObject var customAlertsviewModel = CustomAlertsViewModel()
    
    
    var body: some View {
        
    
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                
                VStack {
                    Text("Custom Alerts")
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                            .frame(maxWidth: .infinity,
                                                   maxHeight: .infinity,
                                                   alignment: .leading)
                                        
                    
                    ForEach(customAlertsviewModel.allCustomAlerts.indices, id: \.self) { index in
                        HStack {
                            Text(customAlertsviewModel.allCustomAlerts[index].getAlertContent())
                            Toggle("", isOn: self.$customAlertsviewModel.allCustomAlerts[index].toggleOn)
                        }
                        Divider()
                            .frame(height: 0.3)
                            .background(Color.gray)
                        
                    }

                
                    Spacer()
                    Group {
                        Text("Notify me when my cat:")
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity,
                                   alignment: .leading)

                        SegmentedControlView(options: ["Poop", "Pee"], selected: eventType)
                        Text("For")
                        SegmentedControlView(options: ["More than", "Less or equals to"], selected: comparator)
                        HStack {
                            TextField(
                                "# of Times",
                                text: $numberOfTime
                            )
                            .keyboardType(.numberPad)
                            .frame(width: 100, height: 50)
                            Text("times")
                                .frame(width: 50, height: 50)
                                .font(.system(size: 15, weight: .light, design: .rounded))
                        }
                        Text("Within")
                        
                        HStack {
                            TextField(
                                "Hours",
                                text: $hour
                            )
                            .keyboardType(.numberPad)
                            .frame(width: 100, height: 50)
                            Text("hours")
                                .frame(width: 50, height: 50)
                                .font(.system(size: 15, weight: .light, design: .rounded))
                        }
                        
                        Button("Save Setting") {
                            hideKeyboard()
                            customAlertsviewModel.createCustomAlert(
                                eventType: eventType.lowercased(),
                                comparator: comparator.lowercased(),
                                numberOfTimes: Int(numberOfTime) ?? 0,
                                timePeriod: Int(hour) ?? 0,
                                toggleOn: true
                            )

                            eventType = "Poop"
                            comparator = "More than"
                            numberOfTime = ""
                            hour = ""
                        }
                        .frame(width: 150, height: 30)
                        .font(.system(size: 15, weight: .light, design: .rounded))
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    }
                }
                .padding()
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.endEditing()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CustomAlertsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertsView()
    }
}
