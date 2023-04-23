//
//  CatProfileViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 4/23/23.
//

import Foundation
import SwiftUI
import Combine

class CatProfileViewModel: ObservableObject {
    @Published var name: String = "Haybe"
    @Published var age: String = "2 years old"
    @Published var gender: String = "Male"
    @Published var breed: String = "British Short Hair"
    @Published var weight: String = "18 Lbs"
    @Published var lastUpdated: String = "3/19/2022"
}
