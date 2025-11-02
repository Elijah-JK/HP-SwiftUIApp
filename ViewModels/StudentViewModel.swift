//
//  StudentViewModel.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation
import Observation

@Observable
class StudentViewModel {
    var students = [Student]()
    
    func fetchStudents() async {
        let url = URL(string: "https://hp-api.onrender.com/api/characters/students")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            students = try JSONDecoder().decode([Student].self, from: data)
        } catch {
            print(error)
        }
    }
}
