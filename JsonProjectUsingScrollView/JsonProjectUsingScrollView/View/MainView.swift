//
//  ContentView.swift
//  JsonProjectUsingScrollView
//
//  Created by G Ajay on 13/02/25.
//

import SwiftUI

struct MainView: View {
    var dictionaryOfEvents = fetchJsonData()
    var body: some View {
        
        let screenWidth = UIScreen.main.bounds.width
        
        NavigationStack {
            VStack {
                HStack {
                    Circle()
                        .fill(Color(red: 0.024, green: 0.381, blue: 0.169))
                        .frame(width: 40)
                        .overlay {
                            Text("JP")
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                        }
                    
                    Circle()
                        .fill(Color(red: 0.024, green: 0.381, blue: 0.169))
                        .frame(width: 40)
                        .overlay {
                            Text("K1")
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                        }
                        .offset(x:-17)
                    
                    Circle()
                        .fill(Color(red: 0.024, green: 0.381, blue: 0.169))
                        .frame(width: 40)
                        .overlay {
                            Image("turtlerock")
                                .resizable()
                                .border(Color.white, width: 2)
                                .cornerRadius(20)
                        }
                        .offset(x:-32)
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor(red: 0.75, green: 0.9, blue: 0, alpha: 0.9)))
                    })
                }
                .padding()
                .padding(.top,-10)
                
                Text("Events Schedule")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, -20)
            }
            Spacer()
            
            TabView {
//                LazyHStack(spacing: 0) {
                    ForEach(dictionaryOfEvents.keys.sorted(by:{
                        let formatter = DateFormatter()
                        formatter.dateFormat = "MMMM-yyyy"
                            guard let date1 = formatter.date(from: $0) , let date2 = formatter.date(from: $1) else {return false}
                            return date1 < date2
                    }), id: \.self) { key in
                        VStack() {
                            Text(key)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.vertical , 9)
                                .padding(.horizontal)
                                .frame(maxWidth: screenWidth, alignment: .leading)
                                .background(Color(UIColor(red: 0.8, green: 0.9, blue: 0, alpha: 0.9)))
                            
                            ScrollView(.vertical) {
                                LazyVStack(spacing: 10) {
                                    ForEach(dictionaryOfEvents[key] ?? [], id: \.self) { event in
                                        NavigationLink(destination: NavigatorView(event: event)) {
                                            EventCellView(event: event)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(width: screenWidth)
                        
                    }
                }
//            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    MainView()
}
