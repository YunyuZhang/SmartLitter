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
    @State private var breed: String = ""
    @State private var weight: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Edit Cat Profile")
                        .padding(30)
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
                                    text: $catName
                                )
                            .frame(width: 200, height: 50)
                        }
                        HStack {
                            Text("Gender")
                            TextField(
                                    "Male/Female",
                                    text: $catName
                                )
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
                    Text("Update Profile")
                        .frame(width: 150, height: 30)
                        .padding(15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.top, 30)
                }
                .font(.system(size: 20, weight: .light, design: .rounded))
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
