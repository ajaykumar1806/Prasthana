//
//  AnimationViewModel.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import Foundation

final class AnimationViewModel:ObservableObject {
    
    @Published var paddleRotation: Double = -10
    @Published var ballPosition: CGPoint = CGPoint(x: 0, y: -50)
    @Published var ballOpacity: Double = 0
    @Published var movingRight: Bool = true
}
