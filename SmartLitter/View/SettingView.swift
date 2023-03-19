//
//  SettingView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI

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
                                    SegmentedControlView(options: ["cat1", "cat2"], selected: "cat1")
                                    SegmentedControlView(options: ["Poop", "Pee"], selected: "Poop")
                                    Text("For")
                                    SegmentedControlView(options: ["More than", "Less or equals to"], selected: "More than")
                                }
                                
                                HStack {
                                    TextField(
                                            "Number of times",
                                            text: $numberOfTime
                                        )
                                    .frame(width: 200, height: 50)
                                    Text("times")
                                }
                                Text("Within")
                                
                                HStack {
                                    TextField(
                                            "Hours",
                                            text: $hour
                                        )
                                    .frame(width: 200, height: 50)
                                    Text("Hours")
                                }
                                
                                Text("Save Setting")
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
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
