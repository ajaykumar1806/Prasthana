//
//  ContentView.swift
//  Task
//
//  Created by G Ajay on 17/02/25.
//

import SwiftUI

let appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)


struct EventView: View {
    let courts:[CourtCell]
    @State var isWithInTeam:Bool = true
    @State var isCoachAvailable:Bool = false
    @State var isAudienceAvailable:Bool = true
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading , spacing: 8) {
                    Text("Review")
                        .font(.title)
                        .bold()
                    Text("It's time to review your event information before publishing it")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Event Type").foregroundStyle(.secondary).bold()
                    HStack{
                        Image(systemName: "trophy")
                            .foregroundColor(appColor)
                        Text("Competitive Game").bold()
                        Spacer()
                        ZStack {
                            Color.init(red: 0.85, green: 1, blue: 0).opacity(0.2).cornerRadius(50)
                                .frame(width: 95, height: 38)
                            HStack{
                                circleDesign(imageName: "lock.rotation.open")
                                Text("Public")
                            }
                        }
                    }
                    .offset(y:-7)
                    
                    HStack {
                        VStack(alignment: .leading , spacing: 8) {
                            Text("Event Dynamic")
                                .bold()
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            Text("Play within my Team").bold()
                        }
                        .padding(.top , -8)
                        Toggle("", isOn: $isWithInTeam).tint(appColor)
                    }
                }
                .padding(.horizontal , 10)
                
                if isWithInTeam {
                    teamView()
                }
                if isCoachAvailable {
                    coachView()
                }
                if isAudienceAvailable {
                    AudienceViewEdit()
                }
                
                ForEach(courts, id: \.courtNumber) { court in
                    CourtView(court: court).padding(.vertical , 8)
                }
                
            }
            NavigationLink(destination: PublishView(), label: {
                greenButtonDesign(buttonName: "Publish Now")
            })
            
            NavigationLink(destination: DraftView(), label: {
                blackButtonDesign(buttonName: "Save as a Draft")
            })
            
            
            .navigationTitle(Text("Review"))
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "questionmark.message")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundStyle(appColor)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundStyle(appColor)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 13, height: 20)
                            .foregroundStyle(appColor)
                    }
                }
            }
            .accentColor(.white)
        }
    }
}


#Preview {
    EventView(courts: courts)
}
