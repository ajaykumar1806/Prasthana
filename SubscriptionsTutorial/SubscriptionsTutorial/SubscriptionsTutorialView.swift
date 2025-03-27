//
//  ContentView.swift
//  SubscriptionsTutorial
//
//  Created by G Ajay on 20/03/25.
//

import SwiftUI
import StoreKit // storekit 2

struct SubscriptionsTutorialView: View {
    var subscriptionsTutorialViewModel = SubscriptionsTutorialViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Apple Store")
                .bold()
                .font(.title)
            Image("Apple Watch")
                .resizable()
                .aspectRatio(contentMode: .fit)
            if let product = subscriptionsTutorialViewModel.products.first {
                Text(product.displayName)
                Text(product.description)
                Button(action: {
                    if subscriptionsTutorialViewModel.purchaseIds.isEmpty {
                        subscriptionsTutorialViewModel.purchase()
                    }
                }, label: {
                    Text(subscriptionsTutorialViewModel.purchaseIds.isEmpty ? "Buy Now \(product.displayPrice)" : "Purhased")
                        .bold()
                        .frame(width: 200)
                        .padding()
                        .background(subscriptionsTutorialViewModel.purchaseIds.isEmpty ? Color.blue.gradient : Color.green.gradient)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                })
            }
        }
        .padding()
        .onAppear() {
            subscriptionsTutorialViewModel.fetchProducts()
        }
    }
}

#Preview {
    SubscriptionsTutorialView()
}
