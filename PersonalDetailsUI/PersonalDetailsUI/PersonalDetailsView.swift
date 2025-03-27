//
//  PersonalDetailsView.swift
//  Task
//
//  Created by G Ajay on 21/02/25.
//

import SwiftUI
import MapKit

struct PersonalDetailsView: View {
    var personalDetailsViewModel = PersonalDetailsViewModel()
    let userId : Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    if let player = personalDetailsViewModel.user {
                        playerHeaderSection(player)
                        if player.parent != nil {
                            if player.parent?.isSignedUp ?? false {
                                registeredParentInfoView(player)
                            }
                            else {
                                parentInfoView(player)
                            }
                        }
                        recentMatchesSection(player)
                        commonEventsSection(player)
                        commonTeamsSection(player)
                        recentCourtsSection(player)
                    } else {
                        ProgressView("Loading Player...")
                    }
                }
                .padding(16)
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 8, height: 16)
                            .foregroundStyle(appColor)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Personal Details")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "questionmark.message")
                            .resizable()
                            .frame(width: 18.04, height: 18.04)
                            .foregroundStyle(appColor)
                    }
                }
            }
        }
        .task {
            await personalDetailsViewModel.fetchPersonalDetails(userId: userId)
        }
    }
}

func playerHeaderSection(_ player: User) -> some View {
    VStack(alignment: .leading,spacing: 32) {
        HStack(spacing: 8) {
            VStack {
                let profileImage = player.avatarFileAttachmentURL
                let url = URL(string: profileImage ?? "")
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person.circle")
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("\(player.firstName ?? "-") \(player.lastName ?? "")")
                    .font(.title)
                    .fontWeight(.heavy)
                ScrollView(.horizontal , showsIndicators: false) {
                    LazyHStack {
                        ForEach(player.roles ?? [""] , id:\.self) { role in
                            Text(role)
                                .padding(.horizontal,8)
                                .font(.footnote)
                                .frame(minHeight: 25)
                                .background(backgroundColor)
                                .cornerRadius(20)
                        }
                    }
                }
                
            }
        }
        VStack(alignment: .leading,spacing: 8) {
            VStack(alignment: .leading,spacing: 6) {
                Text("Phone Number").foregroundStyle(.gray)
                Text(player.mobileNumber ?? "-").bold()
            }
            
            VStack(alignment: .leading,spacing: 6) {
                Text("Email Address").foregroundStyle(.gray)
                Text(player.email ?? "-").bold()
            }
            
            VStack(alignment: .leading,spacing: 6) {
                Text("Clubs").foregroundStyle(.gray)
                if let clubs = player.clubDetails {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(clubs, id: \.self) { club in
                                Text(club)
                                    .padding(.horizontal,8)
                                    .font(.footnote)
                                    .frame(minHeight: 25)
                                    .background(backgroundColor)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
            }
        }
    }
    .padding(.bottom , 8)
}

func parentInfoView(_ player: User) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Parent Info").font(.headline).fontWeight(.heavy)
        
        VStack(alignment: .leading,spacing: 8) {
            Text("Name").foregroundStyle(.gray)
            Text("\(player.parent?.firstName ?? "-") \(player.parent?.lastName ?? "-")").bold()
            
            Text("Phone Number").foregroundStyle(.gray)
            Text(player.parent?.mobileNumber ?? "-").bold()
            
            Text("Email Address").foregroundStyle(.gray)
            Text(player.parent?.email ?? "-").bold()
        }
    }
}

func registeredParentInfoView(_ player: User) -> some View {
    //    NavigationStack {
    //        NavigationLink(destination: PersonalDetailsView(userId: player.parent?.id ?? 0)) {
    //    .sheet(isPresented: ) {
    VStack(alignment: .leading, spacing: 16) {
        Text("Parent Info").font(.headline).fontWeight(.heavy)
        HStack(spacing: 16) {
            let profileImage = player.parent?.avatarFileAttachmentURL
            let url = URL(string: profileImage ?? "")
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.circle")
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            VStack(alignment: .leading,spacing: 4) {
                HStack(spacing: 8) {
                    Text(player.parent?.firstName ?? "-").fontWeight(.heavy)
                    ScrollView(.horizontal , showsIndicators: false) {
                        LazyHStack {
                            ForEach(player.parent?.roles ?? ["-"] , id:\.self) { role in
                                Text(role)
                                    .padding(.horizontal,8)
                                    .font(.footnote)
                                    .frame(minHeight: 25)
                                    .background(backgroundColor)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
                if let clubDetails = player.parent?.clubDetails , !clubDetails.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(clubDetails, id: \.self) { club in
                                Text(club)
                                    .padding(.horizontal,8)
                                    .font(.footnote)
                                    .frame(minHeight: 25)
                                    .background(backgroundColor)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
                else {
                    Text("Team Eagle").foregroundStyle(.secondary)
                }
            }
        }
        .frame(width: 358 , height: 72)
        .padding(12)
        .border(backgroundColor , width: 1)
        .cornerRadius(12)
    }
    //    }
    //        }.tint(.primary)
    //    }
}

func recentMatchesSection(_ player: User) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Recent Matches").font(.headline).fontWeight(.heavy)
        if let recentMatches = player.recentMatches, !recentMatches.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(recentMatches, id: \.id) { recentMatch in
                        recentMatchView(recentMatch)
                    }
                }
            }
        }
        else {
            emptyRecentMatchesView()
        }
    }
}

func commonEventsSection(_ player: User) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Events in Common").font(.headline).fontWeight(.heavy)
        if let commonEvents = player.commonEvents, !commonEvents.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(commonEvents, id: \.id) { commonEvent in
                        commonEventsView(commonEvent)
                    }
                }
            }
        }
        else {
            emptyCommonEventsView()
        }
    }
}

func commonTeamsSection(_ player: User) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Common Teams").font(.headline).fontWeight(.heavy).padding(.vertical , 8)
        if let commonTeams = player.commonTeams, !commonTeams.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(commonTeams, id: \.id) { team in
                        commonTeamsView(team)
                    }
                }
            }
        }
        else {
            emptyCommonTeamsView(player)
        }
    }
}

func recentCourtsSection(_ player: User) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text("Recent Courts").font(.headline).fontWeight(.heavy).padding(.vertical , 8)
        if let courts = player.recentCourts, !courts.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(courts, id: \.id) { court in
                        recentCourtView(court)
                    }
                }
            }
        }
        else {
            emptyRecentCourtsView()
        }
    }
}

func recentCourtView(_ court: RecentCourt) -> some View {
    VStack(spacing: 16){
        HStack(spacing: 8){
            Image(systemName: "location.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.primaryColor)
            VStack{
                Text(court.courtFullName ?? "-")
                    .font(.title3)
                    .fontWeight(.bold)
                Text(court.place?.address ?? "-")
                    .font(.system(size: 18))
                    .foregroundColor(.secondary)
            }
            .frame(width: 204, height: 37)
            Button(action: {}, label: {
                Image(systemName: "arrow.up.forward.bottomleading.rectangle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.primaryColor)
            })
        }
        .frame(width: 268 , height: 37)
        Spacer()
//        MapView(recentCourt: court)
    }
    .frame(width: 300 , height: 220)
    .padding(16)
    .background(backgroundColor)
    .cornerRadius(12)
    
}

//struct MapView: View {
//    let recentCourt: RecentCourt
//
//    @State var snapshotImage: UIImage?
//
//    var body: some View {
//        VStack {
//            if let image = snapshotImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(8)
//            } else {
//                ProgressView("Loading map...")
//            }
//        }
//        .onAppear(perform: loadMapSnapshot)
//    }
//
//    func loadMapSnapshot() {
//        let options = MKMapSnapshotter.Options()
//        if let lati = recentCourt.place?.addressDetail?.latitude , let longi = recentCourt.place?.addressDetail?.longitude {
//            if let latitude = Double(lati), let longitude = Double(longi) {
//                options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(
//                    latitude: latitude,longitude: longitude),
//                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//                options.size = CGSize(width: 268, height: 135)
//                
//            }
//            
//        }
//
//        MKMapSnapshotter(options: options).start { snapshot, _ in
//            snapshotImage = snapshot?.image
//        }
//    }
//}


func commonTeamsView(_ team: CommonTeam) -> some View {
    HStack(spacing: 8){
        Circle()
            .frame(width: 20.91 , height: 20.91)
            .cornerRadius(19.09)
            .foregroundStyle(appColor)
            .overlay(Image(systemName: "medal").foregroundStyle(.black))
        
        Text(team.name ?? "-")
            .font(.body)
            .frame(width: 117 , height: 17)
    }
    .frame(width: 153.91 , height: 28.91)
    .background(Color(appColor.opacity(0.2)))
    .cornerRadius(29)
}

func commonEventsView(_ commonEvent: CommonEvent) -> some View {
    VStack(alignment: .leading , spacing: 20) {
        HStack(spacing: 20) {
            Text(commonEvent.eventType ?? "-")
                .bold()
                .font(.headline)
            Spacer()
            Text("-")
                .font(.caption)
                .frame(width: 61, height: 25)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(29)
                .padding(.vertical , 4)
                .padding(.horizontal , 8)
        }
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image(systemName: "calendar")
                    .foregroundColor(appColor)
                    .frame(width: 24 , height: 24)
                Text(PersonalDetailsViewModel().dateFormatter(dateString: commonEvent.firstStartTime ?? ""))
            }
            
            HStack(spacing: 12) {
                Image(systemName: "book")
                    .foregroundColor(appColor)
                    .frame(width: 24 , height: 24)
                Text("\(commonEvent.eventCourts?.count == 1 ? "1 court" : "\(commonEvent.eventCourts?.count ?? 0) courts")")
            }
            
            HStack(spacing: 12) {
                Image(systemName: "person.2")
                    .foregroundColor(appColor)
                    .frame(width: 24 , height: 24)
                Text(commonEvent.teamName ?? "-")
            }
            
            ///this is bascially to display the number of audience and their pics one on each other
            //                        HStack(spacing: 8){
            //                            imageDesign(imageName: "pic1" )
            //                            imageDesign(imageName: "pic2")
            //                                .offset(x: -20)
            //                            imageDesign(imageName: "pic3")
            //                                .offset(x: -40)
            //                            Text("Cristina, Louise + 32 players")
            //                                .foregroundColor(.secondary)
            //                                .offset(x: -40)
            //                        }
        }
    }
    .padding(20)
    .frame(width: 358 , height: 209)
    .background(backgroundColor)
    .cornerRadius(16)
}

//func getEventTypeName(eventType: String) -> String {
//    let eventTypeModel = DataManager.shared.eventTypes.filter({ $0.key == eventType }).first
//    return eventTypeModel?.label ?? ""
//}

func recentMatchView(_ recentMatch: CommonEvent) -> some View {
    VStack(spacing: 8) {
        VStack(alignment: .leading) {
            Text(PersonalDetailsViewModel().dateFormatter(dateString: recentMatch.firstStartTime ?? "-"))
            Text(recentMatch.eventType ?? "-")
        }.font(.caption).foregroundColor(.secondary).frame(width: 132 , height: 24)
        if let courts = recentMatch.eventCourts {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8) {
                    ForEach(courts, id:\.id) {court in
                        if court.eventCourtPlayers?.count == 1 {
                            if let courtPlayers = court.eventCourtPlayers {
                                VStack {
                                    ForEach(courtPlayers , id:\.id) { courtPlayer in
                                        let url = URL(string: courtPlayer.user?.avatarFileAttachmentURL ?? "")
                                        let name = courtPlayer.user?.firstName ?? "-"
                                        VStack(spacing: 4) {
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Image(systemName: "person.circle")
                                            }
                                            .frame(width: 32, height: 32)
                                            .clipShape(Circle())
                                            Text(name).font(.caption).foregroundColor(.secondary)
                                        }
                                        .padding(.vertical , 8)
                                        .padding(.horizontal , 12)
                                        .frame(width: 132 , height: 67)
                                        .background(backgroundColor)
                                        .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        else {
                            if let courtPlayers = court.eventCourtPlayers {
                                VStack {
                                    ForEach(courtPlayers , id:\.id) { courtPlayer in
                                        
                                        VStack(spacing: 4) {
                                            let url = URL(string: courtPlayer.user?.avatarFileAttachmentURL ?? "")
                                            let name1 = courtPlayer.user?.firstName
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Image(systemName: "person.circle")
                                            }.frame(width: 32, height: 32)
                                                .clipShape(Circle())
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Image(systemName: "person.circle")
                                            }.frame(width: 32, height: 32)
                                                .clipShape(Circle())
                                                .offset(x: -25)
                                            
                                            Text(name1 ?? "").font(.caption).foregroundColor(.secondary)
                                        }
                                        .padding(.vertical , 8)
                                        .padding(.horizontal , 12)
                                        .frame(width: 132 , height: 67)
                                        .background(backgroundColor)
                                        .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    .padding(12)
    .frame(width: 156 , height: 206)
    .border(backgroundColor , width: 1)
    .cornerRadius(16)
}

func emptyRecentMatchesView() -> some View {
    VStack(spacing: 6) {
        VStack {
            Image(systemName: "sportscourt")
                .resizable()
                .frame(width: 32 , height: 32)
                .foregroundStyle(appColor)
            Text("This player has not yet played any matches")
                .foregroundStyle(.secondary).bold()
                .multilineTextAlignment(.center)
        }
        .frame(width: 318)
    }
    .frame(width: 338)
    .padding(20)
    .border(backgroundColor , width: 1)
    .cornerRadius(16)
}

func emptyCommonEventsView() -> some View {
    VStack(spacing: 6) {
        VStack {
            Image(systemName: "list.clipboard")
                .resizable()
                .frame(width: 32 , height: 32)
                .foregroundStyle(appColor)
            Text("This player does'nt have any events in common with this player")
                .foregroundStyle(.secondary).bold()
                .multilineTextAlignment(.center)
        }
        .frame(width: 318)
    }
    .frame(width: 338)
    .padding(20)
    .border(backgroundColor , width: 1)
    .cornerRadius(16)
}

func emptyCommonTeamsView(_ player: User) -> some View {
    HStack(spacing: 32) {
        Button(action: {}, label: {
            Image(systemName: "plus.circle").resizable().foregroundStyle(appColor).frame(width: 24 , height: 24, alignment: .leading)
                .padding(13.28)
        })
        Text("Create a Team with \(player.firstName ?? "")").frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(width: 372 , height: 50)
    .border(backgroundColor , width: 1)
    .cornerRadius(8)
}

func emptyRecentCourtsView() -> some View {
    VStack(spacing: 6) {
        VStack {
            Image(systemName: "book")
                .resizable()
                .frame(width: 32 , height: 32)
                .foregroundStyle(appColor)
            Text("This player doesn't have any court information registered")
                .foregroundStyle(.secondary).bold()
                .multilineTextAlignment(.center)
        }
        .frame(width: 318)
    }
    .frame(width: 338)
    .padding(20)
    .border(backgroundColor , width: 1)
    .cornerRadius(16)
}

#Preview {
    PersonalDetailsView(userId: 1)
}
