//
//  RetroLoadingButtonView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/16/25.
//

import SwiftUI

struct RetroLoadingButtonView: View {
    @State private var isLoading: Bool = false
    @State private var gradientOffset: CGFloat = -1.0
    @State private var rotationAngle: Double = 0
    @State private var meshOffset1: CGFloat = 0
    @State private var meshOffset2: CGFloat = 0
    
    var body: some View {
        Button(action: {
            startLoading()
        }) {
            if isLoading {
                // Loading spinner
                Image(systemName: "arrow.2.circlepath")
                    .font(.inter(16, weight: .bold))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(rotationAngle))
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .frame(minWidth: 250)
            } else {
                // Normal submit text
                Text("Submit")
                    .font(.inter(16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .frame(minWidth: 250)
            }
        }
        .background(
            Group {
                if isLoading {
                    ZStack {
                        // Base animated gradient layer
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 200/255, green: 60/255, blue: 60/255),
                                Color(red: 247/255, green: 6/255, blue: 89/255),
                                Color(red: 254/255, green: 121/255, blue: 77/255),
                                Color(red: 255/255, green: 180/255, blue: 30/255),
                                Color(red: 255/255, green: 204/255, blue: 0/255),
                                Color(red: 240/255, green: 140/255, blue: 40/255),
                                Color(red: 200/255, green: 60/255, blue: 60/255)
                            ]),
                            startPoint: UnitPoint(x: gradientOffset + meshOffset1, y: meshOffset2),
                            endPoint: UnitPoint(x: gradientOffset + meshOffset1 + 1.2, y: 1 + meshOffset2)
                        )
                        
                        // Overlay shimmer effect
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                Color.white.opacity(0.2),
                                Color.white.opacity(0.5),
                                Color.white.opacity(0.2),
                                Color.clear
                            ]),
                            startPoint: UnitPoint(x: gradientOffset, y: 0),
                            endPoint: UnitPoint(x: gradientOffset + 0.4, y: 1)
                        )
                        .blendMode(.overlay)
                    }
                } else {
                    Colors.vibrantRedGradient
                }
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Colors.vibrantRed, lineWidth: 2)
        )
        .disabled(isLoading)
    }
    
    private func startLoading() {
        isLoading = true
        
        // Start shimmer gradient animation
        withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
            gradientOffset = 1.2
        }
        
        // Start mesh point animations for dynamic effect
        withAnimation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {
            meshOffset1 = 0.3
        }
        
        withAnimation(.easeInOut(duration: 3.5).repeatForever(autoreverses: true)) {
            meshOffset2 = -0.2
        }
        
        // Start spinner rotation
        withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        
        // Simulate loading completion after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            stopLoading()
        }
    }
    
    private func stopLoading() {
        isLoading = false
        gradientOffset = -1.2
        meshOffset1 = 0
        meshOffset2 = 0
        rotationAngle = 0
    }
}


#Preview {
    RetroLoadingButtonView()
}
