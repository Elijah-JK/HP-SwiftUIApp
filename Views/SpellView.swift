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
            Group {
                switch vm.state {
                case .idle:
                    Text("No Spells yet")
                case .loading:
                    ProgressView {
                        Text("Loading...")
                    }
                case .loaded:
                    List(vm.spells) { spell in
                        VStack(alignment: .leading) {
                            Text(spell.name)
                            Text(spell.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Spells")
        }
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    SpellView()
}
