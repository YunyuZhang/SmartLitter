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
    @State private var showDeviceNetworkView = false
    
    
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
                            
                            
                            NavigationLink(destination: DeviceNetworkView()) {
                                HStack {
                                    Text("Set Device Network")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                }
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity,
                                       alignment: .leading)
                            }
                            
                            Button("Calibrate Weight") {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                    showBanner = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
                .font(.system(size: 20, weight: .light, design: .rounded))
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .leading)
                .padding()
                
            }
            .overlay(BannerView(showBanner: $showBanner, text: "Weight reading is calibrate"))
            
        }
        
        //        }
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
