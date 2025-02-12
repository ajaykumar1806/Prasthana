//
//  ContentView.swift
//  ListInSwiftUI
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct VideoListView: View {
    var videoArray:[Video] = VideoList.topTen
    var body: some View {
        NavigationStack {
            List(videoArray , id: \.id) { video in
                NavigationLink(destination: VideoDetailView(videoDetails: video), label: {
                    VideoCell(video: video)
                })
            }
            .listStyle(.plain)
            .navigationTitle("Sean's Videos")
        }
    }
}

#Preview {
    VideoListView()
}
