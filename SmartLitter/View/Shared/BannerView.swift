//
//  BannerView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import SwiftUI

struct BannerView: View {
    @Binding var showBanner: Bool
    let text: String
    
    var body: some View {
        VStack {
            if showBanner {
                Text(text)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .transition(.move(edge: .top))
            }
            Spacer()
        }
        .animation(.easeInOut)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(showBanner: .constant(true), text: "Sample banner text")
    }
}

