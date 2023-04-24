//
//  EditProfileView.swift
//  SmartLitter
//
//  Created by Forrest on 3/19/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var catName: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var breed: String = ""
    @State private var weight: String = ""
    @State private var genderIndex = 0
    let genderOptions = [("Male", "♂"), ("Female", "♀")]
    @ObservedObject var catProfileViewModel: CatProfileViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showBanner = false

    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    PageHeaderView(title: "Edit Cat Profile")
                        .padding(20)
                    
                    Image("haybe_profile")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                    Text("Edit profile picture")
                        .frame(width: 300, height: 40)
                        .font(.system(size: 15, weight: .light, design: .rounded))
                        .offset(x:0, y:-20)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Text("Name")
                            TextField(
                                "Name",
                                text: $catName
                            )
                            .frame(width: 200, height: 50)
                        }
                        HStack {
                            Text("Age")
                            TextField(
                                "Approximate Age",
                                text: $age
                            )
                            .frame(width: 200, height: 50)
                        }
                        HStack {
                            Text("Gender")
                            TextField(
                                "Male/Female",
                                text: $gender
                            )
                            
//                            Picker("Gender", selection: $genderIndex) {
//                                ForEach(0..<genderOptions.count) { index in
//                                    HStack {
//    //                                    Text(self.genderOptions[index].0)
//                                        Spacer()
//                                        Text(self.genderOptions[index].1)
//                                    }
//                                    .tag(index)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 200, height: 50)
                        }
                        
                        

                        HStack {
                            Text("Breed")
                            TextField(
                                "Breed",
                                text: $breed
                            )
                            .frame(width: 200, height: 50)
                        }
                        HStack {
                            Text("Weight")
                            TextField(
                                "Weight(lbs)",
                                text: $weight
                            )
                            .frame(width: 200, height: 50)
                        }
                    }
                    
                    Button("Update Profile") {
                        updateProfile()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            showBanner = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            showBanner = false
                            presentationMode.wrappedValue.dismiss()
                        }
                       
                    }
                    .frame(width: 150, height: 30)
                    .padding(15)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.top, 30)
                }
                .font(.system(size: 20, weight: .light, design: .rounded))
            }
            .overlay(BannerView(showBanner: $showBanner, text: "Profile Updated"))
        }
    }
    
    func updateProfile() {
        if !catName.isEmpty {
            catProfileViewModel.name = catName
        }
        if !age.isEmpty {
            catProfileViewModel.age = age
        }
        if !gender.isEmpty {
            catProfileViewModel.gender = gender
        }
        if !breed.isEmpty {
            catProfileViewModel.breed = breed
        }
        if !weight.isEmpty {
            catProfileViewModel.weight = weight
        }
        catProfileViewModel.lastUpdated = "\(Date())"
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
