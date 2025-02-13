//
//  NavigatorView.swift
//  JsonProjectUsingScrollView
//
//  Created by G Ajay on 13/02/25.
//

import SwiftUI

struct NavigatorView: View {
    var event:Event
    var body: some View {
        ZStack(alignment: .center) {
                Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(eventDayFormat(dateString: event.date) ?? "")
                    .bold()
                    .font(.headline)
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(event.time)
                        .font(.caption)
                        .bold()
                }
                Text(event.name)
                    .font(.callout)
                Text(event.location)
                    .font(.caption)
            }
            .frame(width: 330, height: 150 , alignment: .leading)
            .padding(.top,-8)
            .padding(.leading,15)
            .background(Color.white)
            .cornerRadius(10)
        }
        .navigationTitle("Event")
    }
}

//#Preview {
//    NavigatorView()
//}
