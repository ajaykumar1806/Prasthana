//
//  VideoDetailView.swift
//  ListInSwiftUI
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct VideoDetailView: View {
    var videoDetails:Video
    var body: some View {
        ZStack(alignment: .center) {
            Color.black/*.opacity(0.8)*/.ignoresSafeArea()
            VStack(alignment: .center) {
                Image(videoDetails.imageName)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 280, height: 180)
                Text(videoDetails.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title2)
                    .padding(.vertical,8)
                    .frame(maxWidth: 280)
                HStack {
                    HStack {
//                        Image(systemName: "eye")
                        Image(systemName: "eye.circle.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .background()
                            .cornerRadius(7.5)
                        Text(String(videoDetails.viewCount))
                            .fontWeight(.heavy)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    Text(videoDetails.uploadDate)
                        .fontWeight(.heavy)
                        .foregroundStyle(.gray)
                }
                .padding(.vertical,-10)
                Text(videoDetails.description)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Button(action: {
                    UIApplication.shared.open(videoDetails.url)
                }, label: {
                    Text("Watch Now")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/320.0/*@END_MENU_TOKEN@*/, height: 50)
                        .background(Color.red)
                        .cornerRadius(17)
                        .padding(.vertical,60)
                } )
            }
//            .background(Color.gray)
            
        }
    }
}

#Preview {
    VideoDetailView(videoDetails: Video(imageName: "37-tips", title: "37 Tips for Jr. Software Developers", description: "My technical skills as a software developer with 5 years experience are average. They're fine. Nothing special, but not bad either. However, I believe I'm a REALLY good overall software developer because of very good soft skills. In this video I wanted to discuss that topic for those developers out there who may be self-conscience about their lack (or perceived lack) of technical skills and knowledge.", viewCount: 894378, uploadDate: "February 13, 2025", url: URL(string: "https://youtu.be/00o8oBjhdhk")!))
}
