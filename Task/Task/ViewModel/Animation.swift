////
////  Animation.swift
////  Task
////
////  Created by G Ajay on 18/02/25.
////
//
//import SwiftUI
//
//import SwiftUI
//
//import SwiftUI
//
//struct PickleballGameView: View {
//    @State private var ballOffset = 90
//    @State private var moveRight = true
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "tennis.racket")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 60)
//                    .rotationEffect(.degrees(-90))
//                    .foregroundColor(.blue.opacity(0.9))
//                Spacer()
//                Image(systemName: "tennis.racket")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 60)
//                    .rotationEffect(.degrees(0))
//                    .foregroundColor(appColor)
//            }
//            .padding()
//            
//            Circle()
//                .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
//                .fill(LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 23, height: 40)
//                .shadow(color: .gray, radius: 10, x: 5, y: 5)
//                .offset(y:-90)
//                .onAppear {
//                    startBallAnimation()
//                }
//        }
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: [appColor, .black]), startPoint: .leading, endPoint: .trailing))
//        .cornerRadius(20)
////        .background(RadialGradient(gradient: Gradient(colors: [appColor, .black], center: appColor, startRadius: 10, endRadius: 20)))
//    }
//    
////    private func startBallAnimation() {
////        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
////            withAnimation(.easeInOut(duration: 0.8)) {
////                ballOffset.width = moveRight ? 120 : -120
////                moveRight.toggle()
////            }
////        }
////    }
//}
//
//struct PickleballGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickleballGameView()
//    }
//}
//
//
//
//#Preview {
////    Animation()
//}
