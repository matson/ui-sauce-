//
//  request-spinner.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct RequestSpinner: View{

    @State private var rotationAngle: Double = 0
    @State private var counterRotationAngle: Double = 0
    @State private var thirdRingRotationAngle: Double = 0
    @State private var fourthRingRotationAngle: Double = 0
    @State private var yellowRotationAngle: Double = 0
    @State private var yellowCounterRotationAngle: Double = 0

    // yellow gradients
    let yellowGradient1 = AngularGradient(
        colors: [
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0),
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0.5),
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 1)
        ],
        center: .center
    )

    let yellowGradient2 = AngularGradient(
        colors: [
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0.6),
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0.3),
            Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0.05)
        ],
        center: .center
    )

    let warmGradient = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.3, blue: 0.0, opacity: 0.6),  // Orange-red
            Color(red: 1.0, green: 0.6, blue: 0.0, opacity: 0.5),  // Bright orange
            Color(red: 1.0, green: 0.77, blue: 0.0, opacity: 0.4), // Deep yellow
            Color(red: 1.0, green: 0.9, blue: 0.0, opacity: 0.3),  // Yellow
            Color(red: 1.0, green: 0.3, blue: 0.0, opacity: 0.1)   // More red, fade out
        ],
        center: .center
    )

    let vibrantGradient = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.4, blue: 0.7),  // Pink
            Color(red: 0.6, green: 0.2, blue: 0.8),  // Purple
            Color(red: 0.2, green: 0.4, blue: 1.0),  // Blue
            Color(red: 1.0, green: 0.0, blue: 0.2),  // Red
            Color(red: 1.0, green: 0.4, blue: 0.7)   // Loop back to Pink
        ],
        center: .center
    )

    let fadingVibrantGradient = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.7),  // Pink
            Color(red: 0.6, green: 0.2, blue: 0.8, opacity: 0.6),  // Purple
            Color(red: 0.2, green: 0.4, blue: 1.0, opacity: 0.5),  // Blue
            Color(red: 1.0, green: 0.0, blue: 0.2, opacity: 0.4),  // Red
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.2),  // Fading pink
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.05)  // Almost transparent
        ],
        center: .center
    )

    let fadingVibrantGradient2 = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.02),  // Almost transparent
                    Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.1),   // Fading pink
                    Color(red: 1.0, green: 0.0, blue: 0.2, opacity: 0.2),   // Red
                    Color(red: 0.2, green: 0.4, blue: 1.0, opacity: 0.25),  // Blue
                    Color(red: 0.6, green: 0.2, blue: 0.8, opacity: 0.3),   // Purple
                    Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.4)    // Pink
        ],
        center: .center
    )

    let reversedVibrantFadingGradient = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.05),  // Almost transparent pink
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.2),   // Fading pink
            Color(red: 1.0, green: 0.0, blue: 0.2, opacity: 0.4),   // Deep red
            Color(red: 0.2, green: 0.4, blue: 1.0, opacity: 0.6),   // Strong blue
            Color(red: 0.6, green: 0.2, blue: 0.8, opacity: 0.8),   // Rich purple
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.9)    // Vibrant pink
        ],
        center: .center
    )

    let fadingVibrantGradient3 = AngularGradient(
        colors: [
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.01),  // Extremely transparent
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.05),  // Almost transparent pink
            Color(red: 1.0, green: 0.0, blue: 0.2, opacity: 0.08),  // Red
            Color(red: 0.2, green: 0.4, blue: 1.0, opacity: 0.12),  // Blue
            Color(red: 0.6, green: 0.2, blue: 0.8, opacity: 0.15),  // Purple
            Color(red: 1.0, green: 0.4, blue: 0.7, opacity: 0.2)    // Pink
        ],
        center: .center
    )

    let yellowDropShadowColor = Color(red: 254/255, green: 196/255, blue: 0/255, opacity: 0.25)


    let angularGradient1 = AngularGradient(
        colors: [
            Color(red: 200/255, green: 60/255, blue: 60/255, opacity: 0),
            Color(red: 247/255, green: 6/255, blue: 89/255, opacity: 0.5),
            Color(red: 254/255, green: 121/255, blue: 77/255, opacity: 1)
        ],
        center: .center
    )

    let angularGradient2 = AngularGradient(
        colors: [
            Color(red: 254/255, green: 121/255, blue: 77/255, opacity: 0.6),
            Color(red: 247/255, green: 6/255, blue: 89/255, opacity: 0.3),
            Color(red: 200/255, green: 60/255, blue: 60/255, opacity: 0.05)
        ],
        center: .center
    )

    let dropShadowColor = Color(red: 240/255, green: 130/255, blue: 0/255, opacity: 0.25)

    var body: some View{
        VStack(spacing: 40){
            ZStack {

                // fourth ring (outermost) - counter-clockwise with more lag
                Circle()
                    .stroke(fadingVibrantGradient3, lineWidth: 4)
                    .frame(width: 220, height: 220)
                    .rotationEffect(.degrees(fourthRingRotationAngle))
                    .onAppear {
                        withAnimation(.linear(duration: 2.2).repeatForever(autoreverses: false)) {
                            fourthRingRotationAngle = 360
                        }
                    }

                // third ring (outer) - counter-clockwise with lag
                Circle()
                    .stroke(fadingVibrantGradient2, lineWidth: 5)
                    .frame(width: 195, height: 195)
                    .rotationEffect(.degrees(thirdRingRotationAngle))
                    .onAppear {
                        withAnimation(.linear(duration: 1.8).repeatForever(autoreverses: false)) {
                            thirdRingRotationAngle = 360
                        }
                    }

                // Second ring (outer) - counter-clockwise
                Circle()
                    .stroke(fadingVibrantGradient, lineWidth: 5)
                    .frame(width: 175, height: 175)
                    .rotationEffect(.degrees(counterRotationAngle))
                    .onAppear {
                        withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                            counterRotationAngle = -360
                        }
                    }

                // First ring (inner) - clockwise
                Circle()
                    .stroke(reversedVibrantFadingGradient, lineWidth: 10)
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(rotationAngle))
                    .onAppear {
                        withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                            rotationAngle = 360
                        }
                    }

                // Image in the center
                Image("ra_warning")
                    .frame(width: 80, height: 80)

            }
        }
    }
}


#Preview{
    RequestSpinner()
}
