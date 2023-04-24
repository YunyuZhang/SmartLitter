//
//  PageHeaderView.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import SwiftUI

struct PageHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
    }
}

struct PageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PageHeaderView(title: "Edit Cat Profile")
    }
}

