//
//  StaffViewModel.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation
import Observation

@Observable
class StaffViewModel {
    var staff = [Staff]()
    
    func fetchStaff() async {
        let url = URL(string: "https://hp-api.onrender.com/api/characters/staff")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            staff = try JSONDecoder().decode([Staff].self, from: data)
        } catch {
            print(error)
        }
    }
}
