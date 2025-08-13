//
//  ContentView.swift
//  The Burton Family App
//
//  Created by Grant Burton on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    let firstNameOptions = ["Grant", "Hunter", "Amanda", "Scott", "Julie", "Mike"]
    let lastNameOptions = ["Burton", "Watson"]
    let validNames = ["Grant Burton", "Hunter Burton", "Amanda Watson", "Amanda Burton", "Scott Burton", "Julie Burton", "Mike Watson"]
    
    
    var fullName: String {
        [firstName, lastName]
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                chooseBackground()
                Form {
                    Picker("First Name", selection: $firstName) {
                        ForEach(firstNameOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Last Name", selection: $lastName) {
                        ForEach(lastNameOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Section {
                        Text("\(fullName)")
                        NavigationLink("OK") {
                            if !validNames.contains(fullName) {
                                NotFoundView()
                            } else if firstName == "Mike" {
                                MikeView()
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    @ViewBuilder
    func chooseBackground() -> some View {
        let daBoys = ["Grant", "Hunter", "Scott"]
        if daBoys.contains(firstName) && lastName == "Watson" {
            AngularGradient(colors: [.red, .orange, .yellow, .green, .indigo, .blue, .purple], center: .center)
                .ignoresSafeArea()
        } else {
            LinearGradient(colors: [.orange, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}



#Preview {
    ContentView()
}




    
