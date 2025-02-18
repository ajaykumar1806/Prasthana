//
//  PublishView.swift
//  Task
//
//  Created by G Ajay on 17/02/25.
//

import SwiftUI

struct PublishView: View {
    @StateObject var eventViewModel : EventViewModel
    var body: some View {
        
        NavigationStack {
            AnimationView()
            Spacer()
            Text("The Event has been created!")
                .frame(width: 300)
                .font(.largeTitle)
                .bold()
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
                    Text("\(eventViewModel.courts.count) courts")
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
            .background(appColorGradient)
            .cornerRadius(15)
            
            NavigationLink(destination: AudienceView(), label: {
                greenButtonDesign(buttonName: "View Schedule").padding(.vertical , 8)
            })
            
            NavigationLink(destination: AudienceView(), label: {
                blackButtonDesign(buttonName: "View Event Details").foregroundStyle(Color.white)
            })

        }
        Spacer()
    }
}


