//
//  ParentView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct ParentView: View {
    @State var userInput = ""
    var body: some View {
        VStack {
            Rectangle()
                .size(width: 300, height: 200)
                .foregroundColor(userInput.lowercased() == "blue" ? .mint : .red)
                .offset(x:50,y:300)
            ControlPanelView(userInput: $userInput)
        }
            
    }
}

#Preview {
    ParentView()
}
