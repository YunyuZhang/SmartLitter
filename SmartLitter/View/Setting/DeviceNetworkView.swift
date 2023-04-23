//
//  DeviceNetworkView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import SwiftUI
import UIKit

struct DeviceNetworkView: View {
    @State private var showNextView = false
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Step 1: Connect your phone to Wifi: Smart_Extension_WIFI ")
                    .padding(.bottom)
                Text("Step 2: Press Next to enter the Wifi name and password of your home Wifi")
            }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 300, height: 400, alignment: .leading)
            
            Button("Next") {
                showNextView = true
            }
            .frame(width: 150, height: 30)
            .font(.system(size: 15, weight: .light, design: .rounded))
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding()
            
            NavigationLink(destination: WifiInputView(), isActive: $showNextView) {
                EmptyView()
            }
            .hidden()
        }
    }
}



struct DeviceNetworkViw_Previews: PreviewProvider {
    static var previews: some View {
        DeviceNetworkView()
    }
}
