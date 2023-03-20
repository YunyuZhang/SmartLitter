//
//  SettingView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI
import UIKit

struct SettingView: View {
    @State private var toggleOn = true
    
    @State private var numberOfTime: String = ""
    @State private var hour: String = ""
    

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack() {
                            Image(systemName: "person")
                            Text("Forrest Zhang")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                        .frame(width: 150, height: 70)
                        Divider()
                        
                        VStack(spacing:20) {
                            
                            VStack {
                                Text("Account Settings")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity,
                                           alignment: .leading)
                                
                                HStack {
                                    Text("Edit User Profile")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity,
                                       alignment: .leading)
                            }
                            Divider()
                            
                            VStack() {
                                Text("Notification Settings")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity,
                                           alignment: .leading)
                                Toggle("All Notifications", isOn: $toggleOn)
                                Toggle("Notify when there is a usage", isOn: $toggleOn)
                                Group {
                                    Text("Notify me when:")
                                        .frame(maxWidth: .infinity,
                                               maxHeight: .infinity,
                                               alignment: .leading)
                                    SegmentedControlView(options: ["Cat 1", "Cat 2"], selected: "Cat 1")
                                    SegmentedControlView(options: ["Poop", "Pee"], selected: "Poop")
                                    Text("For")
                                    SegmentedControlView(options: ["More than", "Less or equals to"], selected: "More than")
                                }
                                
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
    
                    }
                    .font(.system(size: 20, weight: .light, design: .rounded))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .leading)
                    .padding()
                   
                }
                
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
