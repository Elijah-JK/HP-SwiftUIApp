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
    enum State: Equatable {
        case idle
        case loading
        case loaded([Student])
        case error(String)
    }
    
    var state: State = .idle
    var students = [Student]()
    private let service: HPService
    
    init(service: HPService = DefaultHPService()) {
        self.service = service
    }
    
    func fetch() async {
        guard state == .idle else { return }
        
        state = .loading
        
        do {
            let students = try await service.fetchStudents()
            self.students = students
            self.state = .loaded(students)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown Error")
        } catch {
            self.state = .error("Unknown Error")
        }
    }
}
