//
//  SegmentedControlView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI

struct SegmentedControlView: View {
    
    let options: [String]
    @State var selected : String
    
    var body: some View {
        Picker("", selection: $selected) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(options: ["1","2", "100"], selected: "100")
    }
}
