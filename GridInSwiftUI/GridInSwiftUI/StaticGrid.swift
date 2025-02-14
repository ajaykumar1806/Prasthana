//
//  StaticGrid.swift
//  GridInSwiftUI
//
//  Created by G Ajay on 14/02/25.
//

import SwiftUI

struct StaticGrid: View {
    let event:Event
    var body: some View {
        Grid {
            
            GridRow {
                HStack {
                    VStack {
                        Text(event.date)
                            .font(.largeTitle.bold())
                        Text(event.day)
                    }
                    .padding(.trailing,15)
                    Divider()
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(event.time).bold()
                    Text(event.name)
                }
                .padding(.leading,-20)
                Spacer()
                Circle()
                    .frame(width: 45)
                    .foregroundStyle(.green.gradient)
                    .overlay(content: {
                        Text("JP")
                            .foregroundStyle(.white)
                            .bold()
                    })
            }
        }
        .padding(.all,15)
//        .background(Color.gray)
        .frame(width: .infinity, height: 80)
    }
}

#Preview {
    StaticGrid(event: Event(name: "Competitive Game", date: "03", day: "MON", time: "06:16 PM - 08:16 PM"))
}
