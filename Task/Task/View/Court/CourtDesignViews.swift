//
//  CourtDesignViews.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import SwiftUI

struct circleDesign: View {
    var imageName: String
    var body: some View {
        Circle()
            .frame(width: 30, height: 30)
            .overlay(content: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(appColor)
            })
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

