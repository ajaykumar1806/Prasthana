//
//  structures.swift
//  PersonalDetailsUI
//
//  Created by G Ajay on 25/02/25.
//

import SwiftUI

//The below whole code is for recent matches structure with hard codeded data ,
//once we get data from api we need to just change the labels and images

//struct Doubles:View {
//    let match:RecentMatch
//    var body: some View {
//        VStack {
//            recentMatchesEventDetails(match: match)
//
//            VStack {
//                HStack {
//                    imageDesign(imageName: "pic1")
//                    imageDesign(imageName: "pic4").offset(x: -20)
//                }
//                Text("Zendaya and Elizabeth").font(.caption).foregroundColor(.secondary)
//            }
//            .padding()
//            .background(backgroundColor.opacity(0.5))
//            .cornerRadius(15)
//
//            Divider().frame(maxWidth: 170)
//
//            VStack() {
//                HStack {
//                    imageDesign(imageName: "pic2")
//                    imageDesign(imageName: "pic3").offset(x: -20)
//                }
//                Text("Tom and Matthew").font(.caption).foregroundColor(.secondary)
//            }
//            .padding()
//            .cornerRadius(15)
//        }
//        .padding(10)
//        .frame(width: 200)
//        .border(backgroundColor, width: 1.5)
//        .cornerRadius(20)
//    }
//}


//struct Singles:View {
//    let match:RecentMatchesModel
//    var body: some View {
//        VStack {
//            recentMatchesEventDetails(match: match)
//
//            VStack {
//                HStack {
//                    imageDesign(imageName: "pic4")
//                }
//                Text("Zendaya").font(.caption).foregroundColor(.secondary)
//            }
//            .padding()
//            .frame(width: 155)
//            .background(backgroundColor.opacity(0.5))
//            .cornerRadius(15)
//
//            Divider().frame(maxWidth: 170)
//
//            VStack {
//                HStack {
//                    imageDesign(imageName: "pic1")
//                }
//                Text("Elizabeth").font(.caption).foregroundColor(.secondary)
//            }
//            .padding()
//            .cornerRadius(15)
//        }
//        .padding(10)
//        .frame(width: 200)
//        .border(backgroundColor, width: 1.5)
//        .cornerRadius(20)
//
//    }
//}
//
//struct recentMatchesEventDetails:View {
//    let match:RecentMatchesModel
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text("\(match.matchDate), \(match.matchTime)")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//
//                Text("\(match.matchName)")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//            }
//            Spacer()
//        }
//    }
//}
//
//struct imageDesign:View {
//    let imageName:String
//    var body: some View {
//        Image(imageName).resizable().frame(width: 40, height: 40).clipShape(Circle())
//    }
//}


//func recentMatchView(_ recentMatch: CommonEvent) -> some View {
//    VStack(spacing: 8) {
//        VStack(alignment: .leading) {
//            Text(PersonalDetailsViewModel().dateFormatter(dateString: recentMatch.firstStartTime ?? "-"))
//            Text(recentMatch.eventType ?? "-")
//        }.font(.caption).foregroundColor(.secondary).frame(width: 132 , height: 24)
//        if let courts = recentMatch.eventCourts {
//            ScrollView(.horizontal) {
//                LazyHStack(spacing: 8) {
//                    ForEach(courts, id:\.id) {court in
//                        if court.eventCourtPlayers?.count == 1 {
//                        if let courtPlayers = court.eventCourtPlayers {
//                                VStack {
//                                    ForEach(courtPlayers , id:\.id) { courtPlayer in
//                                        let url = URL(string: courtPlayer.user?.avatarFileAttachmentURL ?? "")
//                                        let name = courtPlayer.user?.firstName ?? "-"
//                                        VStack(spacing: 4) {
//                                            AsyncImage(url: url) { image in
//                                                image.resizable()
//                                            } placeholder: {
//                                                Image(systemName: "person.circle")
//                                            }
//                                            .frame(width: 32, height: 32)
//                                            .clipShape(Circle())
//                                            Text(name).font(.caption).foregroundColor(.secondary)
//                                        }
//                                        .padding(.vertical , 8)
//                                        .padding(.horizontal , 12)
//                                        .frame(width: 132 , height: 67)
//                                        .background(backgroundColor)
//                                        .cornerRadius(8)
//                                    }
//                                }
//                            }
//                        }
//                        else {
//                            if let courtPlayers = court.eventCourtPlayers {
//                                VStack {
//                                    ForEach(courtPlayers , id:\.id) { courtPlayer in
//
//                                        VStack(spacing: 4) {
//                                            let url = URL(string: courtPlayer.user?.avatarFileAttachmentURL ?? "")
//                                            let name1 = courtPlayer.user?.firstName
//                                            AsyncImage(url: url) { image in
//                                                image.resizable()
//                                            } placeholder: {
//                                                Image(systemName: "person.circle")
//                                            }.frame(width: 32, height: 32)
//                                                .clipShape(Circle())
//                                            AsyncImage(url: url) { image in
//                                                image.resizable()
//                                            } placeholder: {
//                                                Image(systemName: "person.circle")
//                                            }.frame(width: 32, height: 32)
//                                                .clipShape(Circle())
//                                                .offset(x: -25)
//                                            
//                                            Text(name1 ?? "").font(.caption).foregroundColor(.secondary)
//                                        }
//                                        .padding(.vertical , 8)
//                                        .padding(.horizontal , 12)
//                                        .frame(width: 132 , height: 67)
//                                        .background(backgroundColor)
//                                        .cornerRadius(8)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        
//    }
//    .padding(12)
//    .frame(width: 156 , height: 206)
//    .border(backgroundColor , width: 1)
//    .cornerRadius(16)
//}

