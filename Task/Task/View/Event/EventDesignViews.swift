//
//  EventDesignViews.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import SwiftUI

struct coachView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Coach")
                .foregroundStyle(.secondary)
                .bold()
            HStack {
                HStack {
                    circleDesign(imageName: "person.circle")
                    Text("Tom").foregroundStyle(.secondary)
                }
                Spacer()
                NavigationLink(destination: EditCoachNavigation()) {
                    Text("Edit Coach").underline().accentColor(appColor)
                }
            }
        }
        .padding(.all,10)
    }
}


struct AudienceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Audience")
                .foregroundStyle(.secondary)
                .bold()
            HStack {
                HStack {
                    circleDesign(imageName: "person.circle")
                    circleDesign(imageName: "person.circle")
                        .offset(x: -14)
                    circleDesign(imageName: "person.circle")
                        .offset(x: -28)
                    circleDesign(imageName: "person.circle")
                        .offset(x: -42)
                    Text("32 spectators").foregroundStyle(.secondary)
                        .offset(x: -42)
                }
                Spacer()
                NavigationLink(destination: EditAudienceView()) {
                    Text("Edit Audience").underline().accentColor(appColor)
                }
            }
        }
        .padding(.all,10)
    }
}

struct teamView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Team").foregroundStyle(.secondary).bold()
            HStack{
                Text("The Galactic Federation of PickleBall Pioneers")
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .bold()
                Spacer()
                HStack{
                    circleDesign(imageName: "medal")
                    Text("Spin Shot League")
                        .font(.caption)
                        .bold()
                }
                .padding(.all, 5)
                .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2))
                .cornerRadius(50)
            }
            .padding()
            .background(appColorGradient)
            .cornerRadius(10)
        }
        .padding(.all,10)
    }
}
