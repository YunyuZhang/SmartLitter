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

    var body: some View {
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
                print("Wi-Fi Name: \(wifiName), Wi-Fi Password: \(wifiPassword)")
            }) {
                Text("Connect")
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct WifiInputView_Previews: PreviewProvider {
    static var previews: some View {
        WifiInputView()
    }
}

