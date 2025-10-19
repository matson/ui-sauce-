//
//  GraphPointView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/19/25.
//
import SwiftUI

struct VitalsGraphPointView: View {
    // The value to display
    let value: Double

    // Whether the point is in range or not
    let isInRange: Bool

    // Value display text format
    let valueText: String

    // Additional configuration properties
    var showValue: Bool = true
    var size: CGFloat = 20
    var insideSize: CGFloat = 12
    var inRangeColor: Color = .green
    var outOfRangeColor: Color = .red

    // Determines if the value should be shown above or below the point
    var showValueAbove: Bool = true

    // Shadow configuration
    var shadowRadius: CGFloat = 2
    var shadowColor: Color = Color.black.opacity(0.3)

    // Border width
    var borderWidth: CGFloat = 1.5

    var body: some View {
        ZStack {
            // Main point
            ZStack{
                Circle()
                    .fill(isInRange ? inRangeColor : outOfRangeColor)
                    .frame(width: size, height: size)
                    .shadow(color: shadowColor, radius: shadowRadius)
                Circle()
                    .fill(Color.white)
                    .frame(width: insideSize, height: insideSize)
            }

            // Value label
            if showValue {
                Text(valueText)
                    .font(.custom("Roboto-Medium", size: 14))
                    .foregroundColor(isInRange ? inRangeColor : outOfRangeColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(color: shadowColor, radius: 1)
                    )
                    .offset(y: showValueAbove ? -(size + 14) : (size + 14))
            }
        }
    }
}

// Supporting model to configure a graph point
struct VitalsGraphPoint {
    // The value to display
    let value: Double

    // The range the value should be in
    let minRange: Double
    let maxRange: Double

    // Position within the graph (normalized from 0 to 1)
    let heightMultiplier: CGFloat

    // Original index position in the data array (for proper alignment with timestamps)
    let originalIndex: Int

    // Whether to show value label
    var showValue: Bool = true

    // Optional formatting function
    var formatter: ((Double) -> String)?

    // Calculate if the value is in range
    var isInRange: Bool {
        return value >= minRange && value <= maxRange
    }

    // Get formatted value text
    var valueText: String {
        if let formatter = formatter {
            return formatter(value)
        }

        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", value)
        } else {
            return String(format: "%.1f", value)
        }
    }
}
