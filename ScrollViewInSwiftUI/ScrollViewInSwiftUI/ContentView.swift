//
//  ContentView.swift
//  ScrollViewInSwiftUI
//
//  Created by G Ajay on 13/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack() {
                ForEach(0..<20) {index in
                    ScrollView(.horizontal) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.7))
                            .frame(width: 200, height: 100,alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .padding()
//                            .offset(x:100)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
