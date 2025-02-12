//
//  AccountView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        VStack {
            Button(profile.isLogged ? "Logout" : "Login" , action: {
                profile.isLogged.toggle()
            })
            .padding()
            .background(Color.blue.opacity(0.6))
            .foregroundStyle(Color.white)
            .cornerRadius(10)
            Divider()
            profile.isLogged ? Text("Hello and welcome back") : Text("Hello, please log in")
            
            BalanceView()
        }
    }
}

//#Preview {
//    AccountView()
//}
