//
//  WifiInputView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import Foundation
import SwiftUI
import WebKit

struct WifiInputView: View {
    
    var body: some View {
        
        WebView(url: URL(string: "http://localhost:8080/wifitest")!)
            .edgesIgnoringSafeArea(.all)
//              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))

        webView.configuration.defaultWebpagePreferences.preferredContentMode = .mobile
        webView.contentMode = .scaleAspectFit

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No update needed
    }
}



struct WifiInputView_Previews: PreviewProvider {
  static var previews: some View {
      WifiInputView()
  }
}
