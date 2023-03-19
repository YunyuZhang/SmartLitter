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
            ScrollView {
                VStack {
                    Text("Cat Profile")
                        .padding(30)
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
                                           .font(.system(size: 20, weight: .light, design: .rounded))
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
                    
                    Text("See Weight Data")
                        .frame(width: 150, height: 30)
                        .font(.system(size: 20, weight: .light, design: .rounded))
                        .padding(15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.top, 30)
                }
            }
            .font(.system(size: 20, weight: .light, design: .rounded))
        }
        .navigationTitle("Cat Profile")
        .accentColor(.blue)
    }
}

struct ProfileText: View {
//    @AppStorage("name") var name = DefaultSettings.name
//    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
//    @AppStorage("description") var description = DefaultSettings.description
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text("name")
                    .bold()
                    .font(.title)
                Text("subtitle")
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            Text("description")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}


struct CatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CatProfileView()
    }
}
