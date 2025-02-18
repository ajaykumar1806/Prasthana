//
//  AnimationView.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import SwiftUI

struct AnimationView: View {
    @StateObject var viewModel = AnimationViewModel()

    var body: some View {
        ZStack {
//            LinearGradient(colors: [.init(red: 0.85, green: 1, blue: 0).opacity(0.5), .black ], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            
            VStack(spacing: 20) {

                ZStack {
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(viewModel.paddleRotation))
                        .offset(x: -70, y: viewModel.movingRight ? 30 : -20)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: viewModel.movingRight)

                    
                    Image(systemName: "tennis.racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 180)
                        .foregroundColor(Color.init(red: 0.85, green: 1, blue: 0))
                        .rotationEffect(.degrees(-190+viewModel.paddleRotation))
                        .offset(x: 70, y: viewModel.movingRight ? -7 : 40)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: viewModel.movingRight)

                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .offset(x: viewModel.ballPosition.x, y: viewModel.ballPosition.y)
                        .opacity(viewModel.ballOpacity)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: viewModel.ballPosition)
                }
                .frame(width: 250, height: 180)
            }
        }
        .onAppear {
            viewModel.paddleRotation = 10
            viewModel.ballOpacity = 1

            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                viewModel.movingRight.toggle()
                viewModel.ballPosition = viewModel.movingRight ? CGPoint(x: 60, y: 20) : CGPoint(x: -60, y: -20)
            }
        }
    }
}


