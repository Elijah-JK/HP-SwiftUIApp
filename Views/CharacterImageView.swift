//
//  CharacterImageView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/4/25.
//

import SwiftUI

struct CharacterImageView: View {
    let urlPath: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlPath)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 175, height: 230)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 230, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            case .failure:
                Image(systemName: "person.crop.square")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.secondary)
                    .frame(width: 175, height: 230)
                    .padding(24)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    CharacterImageView(urlPath: "https://ik.imagekit.io/hpapi/snape.jpg")
}
