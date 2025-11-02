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
    enum State: Equatable {
        case idle
        case loading
        case loaded([Spell])
        case error(String)
    }
    
    var state: State = .idle
    var spells = [Spell]()
    private let service: HPService
    
    init(service: HPService = DefaultHPService()) {
        self.service = service
    }
    
    func fetch() async {
        guard state == .idle else { return }
        
        state = .loading
        
        do {
            let spells = try await service.fetchSpells()
            self.spells = spells
            self.state = .loaded(spells)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } catch {
            self.state = .error("Unknown Error")
        }
    }
}
