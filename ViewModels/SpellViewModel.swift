//
//  SpellViewModel.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation
import Observation

@Observable
class SpellViewModel{
    var spells = [Spell]()
    
    func fetchSpells() async {
        let url = URL(string: "https://hp-api.onrender.com/api/spells")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            spells = try JSONDecoder().decode([Spell].self, from: data)
        } catch {
            print(error)
        }
        
    }
}
