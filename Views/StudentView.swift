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
            Group {
                switch vm.state {
                case .idle:
                    Text("No Students yet")
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                case .loaded:
                    List(vm.students) { student in
                        VStack(alignment: .leading) {
                            Text(student.name)
                        }
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Students")
        }
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    StudentView()
}
