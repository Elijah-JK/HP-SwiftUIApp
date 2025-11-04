//
//  StaffDetailView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/3/25.
//

import SwiftUI

struct StaffDetailView: View {
    let staff: Staff
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 27) {
                        Group {
                            Text("House: \(staff.house)")
                                .fontWeight(.bold)
                            Text("Species: \(staff.species)")
                                .fontWeight(.bold)
                            Text("Gender: \(staff.gender)")
                                .fontWeight(.bold)
                            if let dob = staff.DOB {
                                Text("Date of Birth: \(dob)")
                                    .fontWeight(.bold)
                            }
                            Text("Ancestry: \(staff.ancestry)")
                                .fontWeight(.bold)
                        }
                        .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Right column: image
                    CharacterImageView(urlPath: staff.image)
                }

                Divider()

                if let alternateNames = staff.alternateNames, !alternateNames.isEmpty {
                    Text("Also known as: \(alternateNames.joined(separator: ", "))")
                        .foregroundStyle(.secondary)
                }
                
                Text("Status: \(staff.alive ? "Alive" : "Dead")")
                    .foregroundStyle(.secondary)
                
                Text("Eye Color: \(staff.eyeColor)")
                    .foregroundStyle(.secondary)
                
                Text("Hair Color: \(staff.hairColor)")
                    .foregroundStyle(.secondary)
                
                Text("Patronous: \(staff.patronus != "" ? staff.patronus : "Unknown")")
                    .foregroundStyle(.secondary)
                
                HStack(alignment: .top, spacing: 12) {
                    Text("Wand:")
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Wood: \(staff.wand.wood != "" ? staff.wand.wood : "Unknown")")
                            .foregroundStyle(.secondary)
                        Text("Core: \(staff.wand.core != "" ? staff.wand.core : "Unknown")")
                            .foregroundStyle(.secondary)
                        if let length = staff.wand.length {
                            Text("Length: \(length, specifier: "%.1f")")
                                .foregroundStyle(.secondary)
                        } else {
                            Text("Length: Unknown")
                                .foregroundStyle(.secondary)
                        }
                        
                    }

                }
                
                Text("Played by: \(staff.actor)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
            }
            .padding()
            .navigationTitle(staff.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {    
    StaffDetailView(staff: Staff(id: "3569d265-bd27-44d8-88e8-82fb0a848374", name: "Severus Snape", alternateNames: ["Half-Blood Prince","Snivellus","Sev"], species: "human", gender: "male", house: "Slytherin", DOB: "09-01-1960", ancestry: "half-blood", eyeColor: "black", hairColor: "black", wand: .init(wood: "", core: "", length: nil), patronus: "doe", actor: "Alan Rickman", alive: false, image: "https://ik.imagekit.io/hpapi/snape.jpg"))
}

