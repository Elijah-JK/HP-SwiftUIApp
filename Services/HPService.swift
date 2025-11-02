//
//  HPService.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation

protocol HPService {
    func fetchStaff() async throws -> [Staff]
    func fetchStudents() async throws -> [Student]
    func fetchSpells() async throws -> [Spell]
}
