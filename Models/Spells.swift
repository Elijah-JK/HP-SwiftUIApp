//
//  Spells.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation

struct Spell: Codable, Identifiable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id, name, description
    }
    
    let id: String
    let name: String
    let description: String
}

import Playgrounds

#Playground {
    do {
        let url = URL(string: "https://hp-api.onrender.com/api/spells")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let spells = try JSONDecoder().decode([Spell].self, from: data)
    } catch {
        print(error)
    }
}
