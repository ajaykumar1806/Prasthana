//
//  SubscriptionsTutorialViewModel.swift
//  SubscriptionsTutorial
//
//  Created by G Ajay on 20/03/25.
//

import Foundation
import StoreKit

@Observable
class SubscriptionsTutorialViewModel {
    var products: [Product] = []
    var purchaseIds: [String] = []
    
//    @MainActor
//    init() {
//        observeTransactions()
//    }
    
    func fetchProducts() {
        Task {
            do {
                self.products = try await Product.products(for: ["com.apple.watch"])
                if let product = products.first {
                    await isPurchased(product: product)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func purchase() {
        Task {
            guard let product = products.first else { return }
            do {
                let result = try await product.purchase()
                switch(result) {
                case .success(let verification):
                    switch verification {
                    case .verified(let transaction):
                        print(transaction.productID)
                        self.purchaseIds.append(transaction.productID)
                        await transaction.finish()
                    case .unverified(_, _):
                        break
                    }
                case .userCancelled, .pending:
                    break
                @unknown default:
                    break
                }
            } catch {
                print(error)
            }
        }
    }
    
    func isPurchased(product: Product) async {
        guard let state = await product.currentEntitlement else { return }
        switch state {
        case .verified(let transaction):
            self.purchaseIds.append(transaction.productID)
            print(transaction.productID)
        default:
            break
        }
    }

//    @MainActor
//    func observeTransactions() {
//        Task {
//            for await result in Transaction.updates {
//                if case .verified(let transaction) = result {
//                    await handleTransaction(transaction)
//                }
//            }
//        }
//    }
//
//    func handleTransaction(_ transaction: Transaction) async {
//        self.purchaseIds.append(transaction.productID)
//        print("Restored: \(transaction.productID)")
//        await transaction.finish()
//    }
}
