//
//  StaffView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import SwiftUI

struct StaffView: View {
    @State private var vm = StaffViewModel()
    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .idle:
                    Text("No Staff yet")
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                case .loaded:
                    List(vm.staff) { staff in
                        NavigationLink(value: staff) {
                            HStack(spacing: 12) {
                                Text(staff.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .truncationMode(.tail)

                                Spacer(minLength: 8)

                                Image(staff.house)
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
            .navigationTitle("Staff")
            .navigationDestination(for: Staff.self) { staff in
                StaffDetailView(staff: staff)
                
            }
        }
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    StaffView()
}
