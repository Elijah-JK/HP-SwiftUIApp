//
//  StudentDetailView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/3/25.
//

import SwiftUI

struct StudentDetailView: View {
    let student: Student
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 27) {
                        Group {
                            Text("House: \(student.house)")
                                .fontWeight(.bold)
                            Text("Species: \(student.species)")
                                .fontWeight(.bold)
                            Text("Gender: \(student.gender)")
                                .fontWeight(.bold)
                            if let dob = student.DOB {
                                Text("Date of Birth: \(dob)")
                                    .fontWeight(.bold)
                            }
                            Text("Ancestry: \(student.ancestry)")
                                .fontWeight(.bold)
                        }
                        .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CharacterImageView(urlPath: student.image)
                }
                
                Divider()
                
                if let alternateNames = student.alternateNames, !alternateNames.isEmpty {
                    Text("Also known as: \(alternateNames.joined(separator: ", "))")
                        .foregroundStyle(.secondary)
                }
                
                Text("Status: \(student.alive ? "Alive" : "Dead")")
                    .foregroundStyle(.secondary)
                
                Text("Eye Color: \(student.eyeColor)")
                    .foregroundStyle(.secondary)
                
                Text("Hair Color: \(student.hairColor)")
                    .foregroundStyle(.secondary)
                
                Text("Patronous: \(student.patronus != "" ? student.patronus : "Unknown")")
                    .foregroundStyle(.secondary)
                
                HStack(alignment: .top, spacing: 12) {
                    Text("Wand:")
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Wood: \(student.wand.wood != "" ? student.wand.wood : "Unknown")")
                            .foregroundStyle(.secondary)
                        Text("Core: \(student.wand.core != "" ? student.wand.core : "Unknown")")
                            .foregroundStyle(.secondary)
                        if let length = student.wand.length {
                            Text("Length: \(length, specifier: "%.1f")")
                                .foregroundStyle(.secondary)
                        } else {
                            Text("Length: Unknown")
                                .foregroundStyle(.secondary)
                        }
                        
                    }
                    
                }
                
                Text("Played by: \(student.actor)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
            }
            .padding()
            .navigationTitle(student.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StudentDetailView(student: Student(id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8", name: "Harry Potter", alternateNames: ["The Boy Who Lived","The Chosen One","Undesirable No. 1","Potty"], species: "human", gender: "male", house: "Gryffindor", DOB: "31-07-1980", ancestry: "half-blood", eyeColor: "green", hairColor: "black", wand: .init(wood: "holly", core: "phoenix tail feather", length: 11), patronus: "stag", actor: "Daniel Radcliffe", alive: true, image: "https://ik.imagekit.io/hpapi/harry.jpg"))
}
