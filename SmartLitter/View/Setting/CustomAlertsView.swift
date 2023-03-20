//
//  CustomAlertsView.swift
//  SmartLitter
//
//  Created by Forrest on 3/20/23.
//

import SwiftUI
import UIKit

struct CustomAlertsView: View {
    @State private var numberOfTime: String = ""
    @State private var hour: String = ""
    @State private var toggleOn = true
    
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Custom Alerts")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .leading)
                    Toggle("Cat 1 poop 3 times within 6 hours", isOn: $toggleOn)
                    Spacer()
                    Group {
                        Text("Notify Me When:")
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity,
                                   alignment: .leading)
                        SegmentedControlView(options: ["Cat 1", "Cat 2"], selected: "Cat 1")
                        SegmentedControlView(options: ["Poop", "Pee"], selected: "Poop")
                        Text("For")
                        SegmentedControlView(options: ["More than", "Less or equals to"], selected: "More than")
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
