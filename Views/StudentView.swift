//
//  StudentView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import SwiftUI

struct StudentView: View {
    @State private var vm = StudentViewModel()
    var body: some View {
        NavigationStack {
            List(vm.students) { student in
                Text(student.name)
            }
            .task {
                await vm.fetchStudents()
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    StudentView()
}
