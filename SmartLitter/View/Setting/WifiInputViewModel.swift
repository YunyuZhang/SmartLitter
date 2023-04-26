//
//  WifiInputViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 4/26/23.
//

import SwiftUI

class WifiInputViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showBanner = false
    
    func sendSSIDandPassword(ssid: String, password: String) {
        
        isLoading = true // Set isLoading to true
        let procesedSSID = ssid.replacingOccurrences(of: " ", with: "+")
        
        let urlString = "http://192.168.4.1/?ssid=\(procesedSSID)&pass=\(password)"
        print("url: ", urlString)
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.isLoading = false // Set isLoading back to false
                
                guard error == nil else {
                    print("Error: \(error!)")
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    print("Invalid response")
                    return
                }
                
                print("Response: \(responseString)")
                self.showBanner = true
            }
        }
        
        task.resume()
    }
}
