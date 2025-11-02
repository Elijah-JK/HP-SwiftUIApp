//
//  SpellView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import SwiftUI

struct SpellView: View {
    @State private var vm = SpellViewModel()
    var body: some View {
        NavigationStack {
            List(vm.spells) { spell in
                VStack(alignment: .leading) {
                    Text(spell.name)
                    Text(spell.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .task {
                await vm.fetchSpells()
            }
            .navigationTitle("Spells")
        }
    }
}

#Preview {
    SpellView()
}
