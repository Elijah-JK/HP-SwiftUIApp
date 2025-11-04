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
                        NavigationLink(value: student) {
                            HStack(spacing: 12) {
                                Text(student.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .truncationMode(.tail)

                                Spacer(minLength: 8)

                                Image(student.house)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                    .shadow(radius: 1, y: 1)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Students")
            .navigationDestination(for: Student.self) { student in
                StudentDetailView(student: student)
                
            }
        }
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    StudentView()
}
