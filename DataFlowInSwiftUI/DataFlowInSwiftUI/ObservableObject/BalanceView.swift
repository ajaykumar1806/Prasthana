//
//  BalanceView.swift
//  SwiftUITutorials
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

struct BalanceView: View {
    
    @EnvironmentObject var profile: Profile
    
    var body: some View {
        Text(profile.isLogged ? "Balance is : $2000" : "Login to see balance")
    }
}

//#Preview {
//    BalanceView()
//}
