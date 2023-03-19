//
//  CatProfileView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI


struct CatProfileView: View {

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Cat Profile")
                        .padding(20)
                    SegmentedControlView(options: ["Cat 1", "Cat 2"], selected: "Cat 1")
                    Image("haybe_profile")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                    Text("Haybe")
                        .frame(width: 100, height: 40)
                        .offset(x:0, y: -10)
                    NavigationLink(destination: EditProfileView()) {
                                       Text("Edit Profile")
                                           .frame(width: 150, height: 30)
                                           .font(.system(size: 15, weight: .light, design: .rounded))
                                           .padding(10)
                                           .background(Color.blue)
                                           .foregroundColor(.white)
                                           .cornerRadius(20)
                                   }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Age: 2 years old")
                        Text("Breed: Brisith Short Hair")
                        Text("Weight: 14 Lbs")
                        Text("Last Updated: 3/19/2022")
                    }
                    .padding(.top, 10)
                    
                    NavigationLink(destination: WeightInfoView()) {
                                       Text("See Weight Data")
                                           .frame(width: 150, height: 30)
                                           .font(.system(size: 15, weight: .light, design: .rounded))
                                           .padding(10)
                                           .background(Color.blue)
                                           .foregroundColor(.white)
                                           .cornerRadius(20)
                                   }
                    
                }
            }
            .font(.system(size: 20, weight: .light, design: .rounded))
        }
        .navigationTitle("Cat Profile")
        .accentColor(.blue)
    }
}


struct CatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CatProfileView()
    }
}
