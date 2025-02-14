//
//  ContentView.swift
//  GridInSwiftUI
//
//  Created by G Ajay on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    
    var gridItems = Array(repeating: GridItem(.flexible()), count: 3)
    var gridItems2 :[GridItem] {
        var arr = [GridItem]()
        for _ in 1...3 {
            arr.append(GridItem(.flexible()))
        }
        return arr
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns:gridItems,spacing: 30) {
//                ForEach(0..<20, id: \.self) {index in
//                    ScrollView(.horizontal) {
//                        LazyHGrid(rows:[GridItem(.flexible())]) {
                            ForEach(0..<12, id: \.self) { index in
                                Rectangle()
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .frame(width: 100, height: 100)
                            }
//                        }
//                    }
//                }
            }
        }
    }
}

#Preview {
    ContentView()
}
