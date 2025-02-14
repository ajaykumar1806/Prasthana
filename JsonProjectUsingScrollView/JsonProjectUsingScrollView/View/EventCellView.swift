//
//  EventCellView.swift
//  JsonProjectUsingScrollView
//
//  Created by G Ajay on 13/02/25.
//

import SwiftUI
import UIKit

struct EventCellView: View {
    let event:Event
    var body: some View {
        HStack {
            HStack {
                VStack {
                    Text(String(eventDay(dateString: event.date) ?? 0))
                        .font(.system(size: 35))
                        .bold()
                    Text(eventDayName(dateString: event.date) ?? "NA")
                        .fontWeight(.light)
                }
                .foregroundStyle(Color.black)
                .padding()
                Divider()
                    .padding(.all , 10)
            }
            
            VStack(alignment: .leading) {
                Text(event.time)
                    .bold()
                    .font(.system(size: 22))
                Text(event.name)
            }
            .foregroundStyle(Color.black)
            .padding(.leading,10)
            Spacer()
            
            Circle()
                .fill(Color(red: 0.024, green: 0.381, blue: 0.169))
                .frame(width: 50)
                .overlay {
                    Text("JP")
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                .padding(.trailing , 15)
        }
        .frame(maxWidth: .infinity , maxHeight: 100)
        .padding(.vertical , -8)
//        .background(Color.gray)
    }
}

#Preview {
    EventCellView(event: Event(name: "Competitive Game", date: "2025-02-13", time: "14:30", location: "MindSpace Raidurg"))
}
