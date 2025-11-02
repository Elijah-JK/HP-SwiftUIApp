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
    enum State: Equatable {
        case idle
        case loading
        case loaded([Staff])
        case error(String)
    }
    
    var state: State = .idle
    var staff = [Staff]()
    private let service: HPService
    
    init(service: HPService = DefaultHPService()) {
        self.service = service
    }
    
    func fetch() async {
        guard state == .idle else { return }
        
        state = .loading
        
        do {
            let staff = try await service.fetchStaff()
            self.staff = staff
            self.state = .loaded(staff)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } catch {
            self.state = .error("Unknown Error")
        }
    }
}
