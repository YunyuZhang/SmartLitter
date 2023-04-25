//
//  WifiInputView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import SwiftUI

struct WifiInputView: View {
    @State private var wifiName = ""
    @State private var wifiPassword = ""
    
    @State private var showLoading = false
    @State private var showBanner = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Hardware Wi-Fi Setup")
                    .font(.system(size: 24, weight: .bold, design: .rounded))

                VStack(alignment: .leading, spacing: 10) {
                    Text("Wi-Fi Name")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                    TextField("Enter Wi-Fi Name", text: $wifiName)
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Wi-Fi Password")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                    SecureField("Enter Wi-Fi Password", text: $wifiPassword)
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }

                Button(action: {
                    showLoading = true // Set isLoading to true
                    print("Wi-Fi Name: \(wifiName), Wi-Fi Password: \(wifiPassword)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Wait for 2 seconds
                        showLoading = false // Set isLoading back to false
                        showBanner = true
                    }
                }) {
                    if showLoading {
                        // Show loading indicator if isLoading is true
                        ProgressView()
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color(red: 238/255, green: 68/255, blue: 67/255))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    } else {
                        // Show the Connect button if isLoading is false
                        Text("Connect")
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color(red: 238/255, green: 68/255, blue: 67/255))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            }
        }
        .overlay(
               Group {
                   if showBanner {
                       BannerView(showBanner: $showBanner, text: "Hardware connected to the internet")
                           .onAppear {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                   showBanner = false
                               }
                           }
                   }
               }
           )
        .padding()
    }
}

struct WifiInputView_Previews: PreviewProvider {
    static var previews: some View {
        WifiInputView()
    }
}

