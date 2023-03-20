//
//  AllCatsViewModel.swift
//  SmartLitter
//
//  Created by Forrest on 3/20/23.
//

import Foundation

final class AllCatsViewModel : ObservableObject {
    @Published var weeklyBalance = "?"
    @Published var monthlySpecialBalance = "?"
    @Published var houseworkPoint = "?"
    @Published var lastUpdate = ""
    
    let catList : [Cat]
    var selectionCatMap = [String: Cat]()
    
    init() {
        catList = [
            Cat(name: "Haybe", age: "2", weight: "14", breed: "Britrish Short Hair", gender: "Male", profileImageName: "haybe_profile"),
            Cat(name: "Hunny", age: "1.5", weight: "4", breed: "Britrish Short Hair", gender: "Female", profileImageName: "hunny_profile"),
        ]
        selectionCatMap["Cat 1"] = catList[0]
        selectionCatMap["Cat 2"] = catList[1]
    }
    
    func getSelectedCat(selection: String) -> Cat {
        return selectionCatMap[selection]!
    }
    
    
}
struct Cat: Identifiable {
    let id = UUID()
    var name = ""
    var age = ""
    var weight = ""
    var breed = ""
    var gender = ""
    var profileImageName = ""
}
