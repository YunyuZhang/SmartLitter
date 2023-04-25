//
//  SignInViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 4/24/23.
//

import SwiftUI
import UIKit
import GoogleSignIn


final class SignInViewModel : ObservableObject {
    
    @Published var userName = "please to sign in"
    @Published var isSignedIn: Bool = false
    
    func signInBtnPressed() {
        let signInConfig = GIDConfiguration(clientID: Globals.shared.YOUR_CLIENT_ID)
        GIDSignIn.sharedInstance.configuration = signInConfig
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            guard error == nil else { return }

            // If sign in succeeded, display the app's main content View.
            guard let user = result?.user else { return }

            // Your user is signed in!
            Globals.shared.gUser = user
            
            self.userName = user.profile?.name ?? "please to sign in"
            print("logged in: \(self.userName)")
            
            self.isSignedIn = true
        }
    }
    
    func signOutBtnPressed() {
        GIDSignIn.sharedInstance.signOut()
        self.userName = "please to sign in"
        self.isSignedIn = false
        print("logged out")
    }
    
}
