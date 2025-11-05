//
//  SearchView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/4/25.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    var body: some View {
        NavigationStack {
            Text("Search here.")
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchView()
}
