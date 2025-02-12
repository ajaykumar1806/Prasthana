//
//  VideoCell.swift
//  ListInSwiftUI
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct VideoCell: View {
    var video:Video
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(4)
                .padding(.vertical,3)
            
            VStack(alignment: .leading,spacing: 5) {
                Text(video.title)
                    .font(.headline)
                    .bold()
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading,10)
        }
    }
}

//#Preview {
//    VideoCell()
//}
