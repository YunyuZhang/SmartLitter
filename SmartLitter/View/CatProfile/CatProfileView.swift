//
//  CatProfileView.swift
//  SmartLitter
//
//  Created by Forrest on 3/18/23.
//

import SwiftUI


struct CatProfileView: View {
    
    @StateObject var catProfileViewModel = CatProfileViewModel()


    var body: some View {
//        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    PageHeaderView(title: "Cat Profile")
                        .padding(20)
                    Image("haybe_profile")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                    Text("Haybe")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .frame(width: 100, height: 40)
                        .offset(x:0, y: -10)
                    NavigationLink(
                        destination: EditProfileView(catProfileViewModel: catProfileViewModel)) {
                                       Text("Edit Profile")
                                           .frame(width: 150, height: 30)
                                           .font(.system(size: 15, weight: .light, design: .rounded))
                                           .padding(10)
                                           .background(Color(red: 238/255, green: 68/255, blue: 67/255))
                                           .foregroundColor(.white)
                                           .cornerRadius(20)
                                   }
                    
                    VStack(alignment: .leading, spacing: 20) {
                               Text("Age: \(catProfileViewModel.age)")
                               Text("Gender: \(catProfileViewModel.gender)")
                               Text("Breed: \(catProfileViewModel.breed)")
                               Text("Weight: \(catProfileViewModel.weight)")
                               Text("Last Updated: \(catProfileViewModel.lastUpdated)")
                           }
                    .padding(.top, 10)
                    
                    NavigationLink(destination: WeightInfoView()) {
                                       Text("See Weight Data")
                                           .frame(width: 150, height: 30)
                                           .font(.system(size: 15, weight: .light, design: .rounded))
                                           .padding(10)
                                           .background(Color(red: 238/255, green: 68/255, blue: 67/255))
                                           .foregroundColor(.white)
                                           .cornerRadius(20)
                                   }
                    
                }
            }
            .font(.system(size: 20, weight: .light, design: .rounded))
//        }
        .navigationTitle("Cat Profile")
        .accentColor(.blue)
    }
}


struct CatProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CatProfileView()
    }
}
