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
                        VStack(alignment: .leading) {
                            Text(staff.name)
                        }
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Staff")
        }
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    StaffView()
}
