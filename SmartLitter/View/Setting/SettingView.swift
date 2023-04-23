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
    @State private var showBanner = false
    
    var body: some View {
//        NavigationView {
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
                                    Text("Upgrade to Pro Version")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity,
                                       alignment: .leading)
                            }
                            Divider()
                            
                            VStack {
                                Text("Hardware Settings")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity,
                                           alignment: .leading)
                                
                                HStack {
                                    Text("Device Status: Online")
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 10, height: 10)
                                }
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity,
                                       alignment: .leading)
                                
                                Button("Set Device Network") {
                                    
                                }
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity,
                                           alignment: .leading)
                                
                                Button("Calibrate Weight") {
                                    showBanner = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        showBanner = false
                                    }
                                }.frame(maxWidth: .infinity,
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
                                Toggle("Notify Box Usage", isOn: $toggleOn)
                                
                                
                                NavigationLink(destination: CustomAlertsView()) {
                                    HStack {
                                        Text("Customize Alerts")
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                    }
                                        .font(.system(size: 20, weight: .light, design: .rounded))
                                        .frame(maxWidth: .infinity,
                                               maxHeight: .infinity,
                                               alignment: .leading)
                                }
                            }
                
                        }
    
                    }
                    .overlay(
                                VStack {
                                    if showBanner {
                                        Text("Weight reading is calibrate")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .transition(.move(edge: .top))
                                    }
                                    Spacer()
                                }
                                .animation(.easeInOut)
                            )
                    .font(.system(size: 20, weight: .light, design: .rounded))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .leading)
                    .padding()
                   
                }
                
            }
            
//        }
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
