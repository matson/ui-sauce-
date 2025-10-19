//
//  RetroLoadingButtonView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/16/25.
//

import SwiftUI

struct RetroLoadingButtonView: View {
    @State private var isLoading: Bool = false
    @State private var isLoading2: Bool = false
    @State private var gradientOffset: CGFloat = -1.0
    @State private var rotationAngle: Double = 0
    @State private var isAnimatingGradient: Bool = false
    
    var body: some View {
        ZStack {
            // Dark background
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 60) {
                // Original cyan/blue ice button
                Button(action: {
                    startLoading()
                }) {
                    ZStack {
                        if isLoading {
                            // Loading spinner
                            Image(systemName: "arrow.2.circlepath")
                                .font(.inter(16, weight: .bold))
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(rotationAngle))
                        } else {
                            // Normal submit text
                            Text("Submit")
                                .font(.robotoCondensed(18, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .frame(minWidth: 250, minHeight: 55)
                }
                .background(
                    ZStack {
                        // Ice-like translucent base with subtle angular gradient
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(
                                AngularGradient(
                                    colors: [
                                        Color.white.opacity(0.15),
                                        Color.cyan.opacity(0.1),
                                        Color.blue.opacity(0.08),
                                        Color.white.opacity(0.15)
                                    ],
                                    center: .center,
                                    angle: .degrees(isAnimatingGradient ? 360 : 0)
                                )
                            )
                            .overlay(
                                // Frosted glass effect
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color.white.opacity(0.05))
                                    .blur(radius: 0.5)
                            )
                            .onAppear {
                                withAnimation(Animation.linear(duration: 8.0).repeatForever(autoreverses: false)) {
                                    isAnimatingGradient = true
                                }
                            }
                        
                        if isLoading {
                            // Animated shimmer for loading state
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.clear,
                                            Color.cyan.opacity(0.3),
                                            Color.white.opacity(0.4),
                                            Color.blue.opacity(0.2),
                                            Color.clear
                                        ]),
                                        startPoint: UnitPoint(x: gradientOffset, y: 0),
                                        endPoint: UnitPoint(x: gradientOffset + 0.4, y: 1)
                                    )
                                )
                                .blendMode(.overlay)
                        }
                    }
                )
                .overlay(
                    // Ice-like border with subtle glow
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.3),
                                    Color.cyan.opacity(0.4),
                                    Color.white.opacity(0.2)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                        .shadow(color: Color.cyan.opacity(0.3), radius: 8, x: 0, y: 0)
                )
                .disabled(isLoading)
                
                // Teal and light pink ice button
                Button(action: {
                    startLoading2()
                }) {
                    ZStack {
                        if isLoading2 {
                            // Loading spinner
                            Image(systemName: "arrow.2.circlepath")
                                .font(.inter(16, weight: .bold))
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(rotationAngle))
                        } else {
                            // Normal continue text
                            Text("Continue")
                                .font(.robotoCondensed(18, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .frame(minWidth: 250, minHeight: 55)
                }
                .background(
                    ZStack {
                        // Ice-like translucent base with teal/pink angular gradient
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(
                                AngularGradient(
                                    colors: [
                                        Color.white.opacity(0.15),
                                        Color.teal.opacity(0.12),
                                        Color.pink.opacity(0.08),
                                        Color.white.opacity(0.15)
                                    ],
                                    center: .center,
                                    angle: .degrees(isAnimatingGradient ? 360 : 0)
                                )
                            )
                            .overlay(
                                // Frosted glass effect
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color.white.opacity(0.05))
                                    .blur(radius: 0.5)
                            )
                        
                        if isLoading2 {
                            // Animated shimmer for loading state
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.clear,
                                            Color.teal.opacity(0.3),
                                            Color.white.opacity(0.4),
                                            Color.pink.opacity(0.2),
                                            Color.clear
                                        ]),
                                        startPoint: UnitPoint(x: gradientOffset, y: 0),
                                        endPoint: UnitPoint(x: gradientOffset + 0.4, y: 1)
                                    )
                                )
                                .blendMode(.overlay)
                        }
                    }
                )
                .overlay(
                    // Ice-like border with teal/pink glow
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.3),
                                    Color.teal.opacity(0.4),
                                    Color.pink.opacity(0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                        .shadow(color: Color.teal.opacity(0.3), radius: 8, x: 0, y: 0)
                )
                .disabled(isLoading2)
            }
        }
    }
    
    private func startLoading() {
        isLoading = true
        
        // Start shimmer gradient animation
        withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
            gradientOffset = 1.2
        }
        
        // Start spinner rotation
        withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        
        // Simulate loading completion after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            stopLoading()
        }
    }
    
    private func stopLoading() {
        isLoading = false
        gradientOffset = -1.0
        rotationAngle = 0
    }
    
    private func startLoading2() {
        isLoading2 = true
        
        // Start shimmer gradient animation
        withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
            gradientOffset = 1.2
        }
        
        // Start spinner rotation
        withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        
        // Simulate loading completion after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            stopLoading2()
        }
    }
    
    private func stopLoading2() {
        isLoading2 = false
        gradientOffset = -1.0
        rotationAngle = 0
    }
}


#Preview {
    RetroLoadingButtonView()
}
