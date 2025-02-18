//
//  PublishView.swift
//  Task
//
//  Created by G Ajay on 17/02/25.
//

import SwiftUI

struct PublishView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            Text("The Event has been created!")
                .frame(width: 300, height: 100)
                .font(.largeTitle)
                .bold()
                .lineSpacing(7)
            
            Text("Get ready to rally! Your pickleball event is oficially set. Gather your paddles, and let the fun begin.")
                .frame(width: 350, height: 100)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .font(.headline)
                .lineSpacing(5)
                .font(.system(size: 30))
            
            VStack(alignment: .leading , spacing: 20) {
                HStack {
                    Image(systemName: "book")
                        .foregroundStyle(appColor)
                    Text("\(courts.count) courts")
                    Spacer()
                }
                .padding(.horizontal)
                HStack() {
                    circleDesign(imageName: "person.circle")
                    circleDesign(imageName: "person.circle")
                        .padding(.horizontal , -14)
                    circleDesign(imageName: "person.circle")
                    Text("Michael, Louise + 32 players")
                }
                .padding(.horizontal)
            }
            .frame(width: 350)
            .padding()
            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.12))
            .cornerRadius(15)
            
            NavigationLink(destination: PublishView(), label: {
                greenButtonDesign(buttonName: "View Schedule").padding(.vertical , 8)
            })
            
            NavigationLink(destination: DraftView(), label: {
                blackButtonDesign(buttonName: "View Event Details").foregroundStyle(Color.white)
            })
        }
        Spacer()
    }
}

#Preview {
    PublishView()
}
