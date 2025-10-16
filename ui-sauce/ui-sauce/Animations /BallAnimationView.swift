//
//  Ball.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/16/25.
//

import SwiftUI
internal import Combine


struct BallAnimationView: View {
    @State private var ball1Position: CGPoint = CGPoint(x: 100, y: 100) // initial position of first ball
    @State private var ball1Velocity = CGPoint(x: 5, y: 5) // initial ball1 velocity
    @State private var ball2Position: CGPoint = CGPoint(x: 200, y: 200) // initial position of second ball  
    @State private var ball2Velocity = CGPoint(x: -3, y: -4) // initial ball2 velocity
    @State private var screenSize: CGSize = .zero

    let circleSize: CGFloat = 50 // diameter of ball

    var body: some View {
        GeometryReader { geometry in
            ZStack {

                // background color
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)

                // First Ball (Orange)
                BallView(color: .orange, size: circleSize)
                    .position(ball1Position)
                
                // Second Ball (Green)
                BallView(color: .green, size: circleSize)
                    .position(ball2Position)
                .onAppear {
                    screenSize = geometry.size
                    startAnimation()
                }
                .onReceive(Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()) { _ in
                    updatePosition()
                }
            }
        }
        .ignoresSafeArea(.all)
    }

    func startAnimation() {
        ball1Velocity = CGPoint(x: 5, y: 5) // set the initial velocity of ball1
        ball2Velocity = CGPoint(x: -3, y: -4) // set the initial velocity of ball2
    }

    func updatePosition() {
        // Calculate new positions
        let newBall1Position = CGPoint(
            x: ball1Position.x + ball1Velocity.x,
            y: ball1Position.y + ball1Velocity.y
        )
        
        let newBall2Position = CGPoint(
            x: ball2Position.x + ball2Velocity.x,
            y: ball2Position.y + ball2Velocity.y
        )
        
        // Check for collision between balls
        let distance = sqrt(pow(newBall1Position.x - newBall2Position.x, 2) + pow(newBall1Position.y - newBall2Position.y, 2))
        
        if distance <= circleSize {
            // Collision detected - reverse both ball velocities
            ball1Velocity.x *= -1
            ball1Velocity.y *= -1
            ball2Velocity.x *= -1  
            ball2Velocity.y *= -1
        }
        
        // Ball 1 bounds checking
        if newBall1Position.x < circleSize / 2 || newBall1Position.x > screenSize.width - circleSize / 2 {
            ball1Velocity.x *= -1
        }
        if newBall1Position.y < circleSize / 2 || newBall1Position.y > screenSize.height - circleSize / 2 {
            ball1Velocity.y *= -1
        }
        
        // Ball 2 bounds checking  
        if newBall2Position.x < circleSize / 2 || newBall2Position.x > screenSize.width - circleSize / 2 {
            ball2Velocity.x *= -1
        }
        if newBall2Position.y < circleSize / 2 || newBall2Position.y > screenSize.height - circleSize / 2 {
            ball2Velocity.y *= -1
        }
        
        // Update positions
        ball1Position = CGPoint(
            x: ball1Position.x + ball1Velocity.x,
            y: ball1Position.y + ball1Velocity.y
        )
        
        ball2Position = CGPoint(
            x: ball2Position.x + ball2Velocity.x,
            y: ball2Position.y + ball2Velocity.y
        )
    }
}

#Preview {
    BallAnimationView()
}
