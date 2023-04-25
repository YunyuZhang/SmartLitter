//
//  SignInView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//


import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
    @ObservedObject private var signInViewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
                Text("Welcome")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Spacer()
                                    
                SignInButton(imageName: "Google_SignIn") {
                    signInViewModel.signInBtnPressed()
                }
                
                NavigationLink("", destination: MainView(), isActive: $signInViewModel.isSignedIn)
                                    .hidden()
                
                NavigationLink(destination: MainView()) {
                    SignInButton(imageName: "Facebook_SignIn") {}
                }
                
                NavigationLink(destination: MainView()) {
                    SignInButton(imageName: "Apple_SignIn") {}
                }
                
            }
        }
    }
}

struct SignInButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
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
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
