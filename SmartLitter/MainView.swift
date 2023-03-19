//
//  ContentView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection = 0
    
    var body: some View {
            TabView(selection: $selection){
                CatProfileView()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image("Cat_icon")
                                .frame(width: 2, height: 2)
                            Text("Cat Profile")
                        }
                    }
                    .tag(0)
                HistoryView()
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.bar.doc.horizontal")
                            Text("History")
                        }
                    }
                    .tag(1)
    
                SettingView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gearshape")
                            Text("Setting")
                        }
                    }
                    .tag(2)
               
            }
            .accentColor(.red)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
