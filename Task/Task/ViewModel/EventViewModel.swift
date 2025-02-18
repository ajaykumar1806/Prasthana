//
//  EventViewModel.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import SwiftUI

struct DraftView: View {
    var body: some View {
        Text("Draft View")
    }
}

struct EditAudienceView: View {
    var body: some View {
        Text("Audience Edit View")
    }
}

struct EditCoachNavigation: View {
    var body: some View {
        Text("Coach Evit View")
    }
}

struct SlotSelectionView: View {
    var body: some View {
        Text("Slot Selection View")
    }
}

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


struct AudienceViewEdit: View {
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
            .background(Color.init(red: 0.85, green: 1, blue: 0).opacity(0.1))
            .cornerRadius(10)
        }
        .padding(.all,10)
    }
}

struct greenButtonDesign: View {
    let buttonName:String
    var body: some View {
        Text(buttonName)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .padding()
            .frame(width: 384, height: 50)
            .background(appColor)
            .cornerRadius(15)
    }
}

struct blackButtonDesign: View {
    let buttonName:String
    var body: some View {
        Text(buttonName)
            .fontWeight(.bold)
            .padding()
            .frame(width: 384, height: 50)
            .background(.black)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 1)
            }
    }
}

struct circleDesign: View {
    var imageName: String
    var body: some View {
        Circle()
//            .fill(Color.init(red: 0.75, green: 0.9, blue: 0))
            .frame(width: 30, height: 30)
            .overlay(content: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.black)
            })
    }
}


//struct navigationToolbar: View {
//    var body: some View {
//        
//    }
//}
