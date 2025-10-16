//
//  BallView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/16/25.
//
import SwiftUI

struct BallView: View {
    let color: Color
    let size: CGFloat

    var body: some View {
        ZStack {
            // Deeper shadow for more 3D effect
            Circle()
                .fill(Color.black.opacity(0.4))
                .frame(width: size, height: size)
                .offset(x: 3, y: 4)
                .blur(radius: 2)

            // Main ball with enhanced 3D gradient
            Circle()
                .fill(
                    RadialGradient(
                        colors: getBallColors(),
                        center: UnitPoint(x: 0.3, y: 0.25),
                        startRadius: 3,
                        endRadius: size/2
                    )
                )
                .frame(width: size, height: size)
                .overlay(
                    // Enhanced highlight for more 3D effect
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white.opacity(0.8),
                                    Color.white.opacity(0.3),
                                    Color.white.opacity(0.0)
                                ],
                                center: UnitPoint(x: 0.25, y: 0.2),
                                startRadius: 0,
                                endRadius: 15
                            )
                        )
                        .frame(width: 20, height: 20)
                        .offset(x: -8, y: -8)
                )
                .overlay(
                    // Secondary smaller highlight
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white.opacity(0.4),
                                    Color.white.opacity(0.0)
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 6
                            )
                        )
                        .frame(width: 8, height: 8)
                        .offset(x: 5, y: 8)
                )
        }
    }

    private func getBallColors() -> [Color] {
        switch color {
        case .orange:
            return [
                Color.orange.opacity(1.0),
                Color(red: 1.0, green: 0.6, blue: 0.0),
                Color(red: 0.8, green: 0.3, blue: 0.0),
                Color(red: 0.6, green: 0.2, blue: 0.0)
            ]
        case .green:
            return [
                Color.green.opacity(1.0),
                Color(red: 0.0, green: 0.8, blue: 0.0),
                Color(red: 0.0, green: 0.6, blue: 0.0),
                Color(red: 0.0, green: 0.4, blue: 0.0)
            ]
        default:
            return [color, color.opacity(0.7), color.opacity(0.5), color.opacity(0.3)]
        }
    }
}
