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
            List(vm.staff) { staff in
                Text(staff.name)
            }
            .task {
                await vm.fetchStaff()
            }
            .navigationTitle("Staff")
        }
    }
}

#Preview {
    StaffView()
}
