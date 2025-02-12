//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var age = 23
    @State var name: String = ""
    var body: some View {
        Text("Hello my name is: \(name)")
        Text("My age is: \(age)")
        Button("Increment") {
            age += 1
        }
        TextField("Enter your name", text: $name)
            .offset(x:50)
    }
}

#Preview {
    ContentView()
}
