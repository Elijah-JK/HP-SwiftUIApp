//
//  DefaultHPService.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import Foundation

struct DefaultHPService: HPService {
    func fetchData<T: Decodable>(from URLString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: URLString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let HTTPResponse = response as? HTTPURLResponse,
                  (200...299).contains(HTTPResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            return try JSONDecoder().decode(type.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
    func fetchStaff() async throws -> [Staff] {
        let url = "https://hp-api.onrender.com/api/characters/staff"
        return try await fetchData(from: url, type: [Staff].self)
    }
    func fetchStudents() async throws -> [Student] {
        let url = "https://hp-api.onrender.com/api/characters/students"
        return try await fetchData(from: url, type: [Student].self)
    }
    func fetchSpells() async throws -> [Spell] {
        let url = "https://hp-api.onrender.com/api/spells"
        return try await fetchData(from: url, type: [Spell].self)
    }
}
