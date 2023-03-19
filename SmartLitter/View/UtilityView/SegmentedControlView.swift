//
//  SegmentedControlView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI

struct SegmentedControlView: View {
    
    enum TimeRangeSection : String, CaseIterable {
        case oneWeek = "1W"
        case oneMonth = "1M"
        case sixMonth = "6M"
        case oneYear = "1Y"
    }
    @State var selected : TimeRangeSection = .oneWeek
    
    var body: some View {
        Picker("", selection: $selected) {
                    ForEach(TimeRangeSection.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
