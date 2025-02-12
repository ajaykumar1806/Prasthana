//
//  ControlPanelView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct ControlPanelView: View {
    @Binding var userInput:String
    var body: some View {
        TextField("Enter Text", text: $userInput)
            .padding(.leading,40)
    }
}

//#Preview {
//    ControlPanelView()
//}
