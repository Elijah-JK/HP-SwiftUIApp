//
//  Staff.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation

struct Staff: Codable, Identifiable, Equatable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id, name, species, gender, house, ancestry, wand, patronus, actor, alive, image
        
        case alternateNames = "alternate_names"
        case DOB = "dateOfBirth"
        case eyeColor = "eyeColour"
        case hairColor = "hairColour"
    }
    
    let id: String
    let name: String
    let alternateNames: [String]?
    let species: String
    let gender: String
    let house: String
    let DOB: String?
    let ancestry: String
    let eyeColor: String
    let hairColor: String
    let wand: Wand
    let patronus: String
    let actor: String
    let alive: Bool
    let image: String
}

import Playgrounds

#Playground {
    do {
        let url = URL(string: "https://hp-api.onrender.com/api/characters/staff")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let staff = try JSONDecoder().decode([Staff].self, from: data)
    } catch {
        print(error)
    }
}
