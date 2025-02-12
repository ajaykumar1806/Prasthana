//
//  ContentView.swift
//  JsonProjectUsingSwiftUI
//
//  Created by G Ajay on 10/02/25.
//

import SwiftUI

struct ContentView: View {
    
    var dictOfEvents = fetchJsonData()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text("JP")
                        .padding(7)
                        .background(Color(red: 0.010, green: 0.3, blue: 0))
                        .foregroundStyle(.white)
                        .bold()
                        .clipShape(Circle())

                    Text("K1")
                        .padding(7)
                        .background(Color(red: 0.010, green: 0.3, blue: 0))
                        .foregroundStyle(.white)
                        .bold()
                        .clipShape(Circle())
                        .offset(x: -13)

                    Text("K2")
                        .padding(7)
                        .background(Color(red: 0.010, green: 0.3, blue: 0))
                        .foregroundStyle(.white)
                        .bold()
                        .clipShape(Circle())
                        .offset(x: -27)

                    Spacer()

                    Button(action: {}, label: {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor(red: 0.75, green: 0.9, blue: 0, alpha: 0.9)))
                    })
                }
                .padding()

                Text("Events Schedule")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, -20)

                List {
                    ForEach(dictOfEvents.keys.sorted (by:{
                        let formatter = DateFormatter()
                        formatter.dateFormat = "MMMM-yyyy"
                            guard let date1 = formatter.date(from: $0) , let date2 = formatter.date(from: $1) else {return false}
                            return date1 < date2
                    }), id: \.self) { month in
                        Section(header:
                            Text(month)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.all, 10.0)
                                .padding(.leading)
                                .background(Color(UIColor(red: 0.8, green: 0.9, blue: 0, alpha: 0.9)))
                                .listRowInsets(EdgeInsets())
                        ){
                            ForEach(dictOfEvents[month] ?? [], id: \.date) { event in
                                NavigationLink(destination: NavigatorView(event: event)) {
                                    RowUIView(event: event)
                                        .padding(.vertical,-5)
                                        .padding(.leading,-7) } }
                        }
                    }
                }
                .offset(y:-12)
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    ContentView()
}
