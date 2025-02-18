//
//  CourtView.swift
//  Task
//
//  Created by G Ajay on 17/02/25.
//

import SwiftUI

import SwiftUI

struct CourtView: View {
    let court: CourtCell
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Court \(court.courtNumber)")
                    .font(.headline)
                    .bold()
                Spacer()
                Text("\(court.singleOrDouble)")
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(appColor)
                    VStack(alignment: .leading) {
                        Text("\(court.weekDay), ".localizedCapitalized + "\(court.month) \(court.date), \(court.time)")
                            .bold()
                        Text("\(court.duration) duration")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical , 10)
                Spacer()
                HStack {
                    Image(systemName: "location.north.circle")
                        .foregroundColor(appColor)
                    VStack(alignment: .leading) {
                        Text("\(court.location)".localizedCapitalized).bold()
                        Text("\(court.district), \(court.city), \(court.pincode)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom , 10)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(appColorGradient)
            .cornerRadius(12)
            
            HStack(spacing: -10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                
                Text("\(court.numberOfPlayers) players")
                    .font(.subheadline)
                    .padding(.leading, 15)
                
                Spacer()
                
                NavigationStack {
                    NavigationLink(destination: SlotSelectionView()) {
                        Text("Edit Players").underline().accentColor(appColor)
                    }
                }
            }
        }
        .padding()
        .background(appColorGradient)
        .cornerRadius(12)
        .padding(.horizontal,12)
        
    }
}

#Preview {
    EventView()
}
