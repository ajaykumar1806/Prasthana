//
//  RowUIView.swift
//  JsonProjectUsingSwiftUI
//
//  Created by G Ajay on 10/02/25.
//

import SwiftUI

struct RowUIView: View {
    let event:Event
    var body: some View {
        HStack {
            VStack {
                Text(String(eventDay(dateString: event.date) ?? 0))
                    .font(.largeTitle)
                Text(String(eventDayName(dateString: event.date) ?? "NA"))
                    .font(.system(size: 15))
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding()
            .overlay(
                Rectangle()
                    .frame(width:0.4)
                    .foregroundColor(.gray)
                    .offset(x:35)
            )
            VStack {
                Text(event.time)
                    .font(.headline)
                Text(event.name)
                    .font(.caption)
            }
            .padding()
            Spacer()
            Text("EV").symbolVariant(.circle)
                .padding()
                .background(Color(red: 0.024, green: 0.231, blue: 0.169))
                .foregroundStyle(.white)
                .clipShape(.circle)
        }
    }
}

#Preview {
    RowUIView(event: Event(name: "Event 1", date: "2025-02-13", time: "19:00", location: "Raidurg"))
}
