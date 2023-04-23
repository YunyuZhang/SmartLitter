//
//  WifiInputView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import Foundation
import SwiftUI
import WebKit

struct WifiWebsiteView: View {
    
    var body: some View {
   
        WebView(url: URL(string: "https://iotprojectbackend-ltq2si4ddq-ue.a.run.app/wifitest")!)
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



struct WifiWebsiteView_Previews: PreviewProvider {
  static var previews: some View {
      WifiWebsiteView()
  }
}
