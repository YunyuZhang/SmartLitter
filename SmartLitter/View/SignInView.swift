//
//  SignInView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//


import SwiftUI
import AuthenticationServices

struct SignInView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
                Text("Welcome")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Spacer()
                                    
                NavigationLink(destination: MainView()) {
                    SignInButton(imageName: "Google_SignIn")
                }
                
                NavigationLink(destination: MainView()) {
                    SignInButton(imageName: "Facebook_SignIn")
                }
                
                NavigationLink(destination: MainView()) {
                    SignInButton(imageName: "Apple_SignIn")
                }
            }
        }
    }
}

struct SignInButton: View {
    let imageName: String
    
    var body: some View {
        
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 320, height: 50)
                .aspectRatio(contentMode: .fill)
        }
        
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
