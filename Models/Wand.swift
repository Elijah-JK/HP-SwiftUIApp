//
//  Wand.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation

struct Wand: Codable, Equatable, Hashable {
    enum CodingKeys: String, CodingKey {
        case wood, core, length
    }
    let wood: String
    let core: String
    let length: Double?
}
