//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("turtlerock")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .clipShape(.circle)
            Spacer()
            Text("Hello").padding()
                .background(.blue)
                .padding()
                .font(.headline)
            
        }
    }
}

#Preview {
    ContentView()
}
