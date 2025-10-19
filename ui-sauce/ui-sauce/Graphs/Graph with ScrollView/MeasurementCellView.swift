//
//  MeasurementCellView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/19/25.
//

import SwiftUI

struct MeasurementCellView: View {
    let title: String
    let value: String
    let unit: String
    let values: [Double]
    let dateTimeData: [(String, String)]
    let isInRange: Bool

    private var maxValue: Double {
        values.max() ?? 1
    }

    private var minValue: Double {
        values.min() ?? 0
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.inter(18, weight: .medium))
                        .lineLimit(1)
                        .foregroundStyle(Color(.black))

                    Text(unit)
                        .font(.inter(16, weight: .regular))
                        .foregroundStyle(Color(.gray))
                }
                .frame(maxWidth: 150, alignment: .leading)

                Spacer()

                Text(value)
                    .font(.inter(20, weight: .bold))
                    .foregroundStyle(isInRange ? Color.blue : Color.orange)
                    .padding(.trailing, 15)
            }
            .padding(.leading, 25)
            .padding(.top, 15)
            .padding(.bottom, 10)

            // Background with dotted lines and gradient (full width)
            ZStack {
                // Light gray-blue gradient background with white fade on leading edge
                GeometryReader { gradientGeometry in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white,
                                    Color.blue.opacity(0.05),
                                    Color.gray.opacity(0.03)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .padding(.leading, 35)
                }

                // Dotted lines layer (full width to trailing edge)
                GeometryReader { geometry in
                    let height = geometry.size.height
                    let valueRange = maxValue - minValue

                    // Dotted lines for min and max values
                    let minY = height - (valueRange > 0 ? 0 : 0.5 * height)
                    let maxY = height - (valueRange > 0 ? height : 0.5 * height)

                    // Min value dotted line (bottom)
                    Path { path in
                        path.move(to: CGPoint(x: 35, y: minY))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: minY))
                    }
                    .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))

                    // Max value dotted line (top)
                    Path { path in
                        path.move(to: CGPoint(x: 35, y: maxY))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: maxY))
                    }
                    .stroke(Color.gray.opacity(0.5), style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
                }

                // Points and lines layer (with padding)
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let maxDateCount = 8
                    let pointSpacing = width / CGFloat(maxDateCount - 1)
                    let valueRange = maxValue - minValue

                    // Connect the dots with lines (only if more than 1 point)
                    if values.count > 1 {
                        Path { path in
                            for index in 0..<values.count {
                                let x = CGFloat(index) * pointSpacing
                                let normalizedValue = valueRange > 0 ? CGFloat((values[index] - minValue) / valueRange) : 0.5
                                let y = height - (normalizedValue * height)

                                if index == 0 {
                                    path.move(to: CGPoint(x: x, y: y))
                                } else {
                                    path.addLine(to: CGPoint(x: x, y: y))
                                }
                            }
                        }
                        .stroke(isInRange ? Color.blue : Color.orange, lineWidth: 2)
                    }

                    // Graph Points
                    ForEach(0..<values.count, id: \.self) { index in
                        let x = CGFloat(index) * pointSpacing
                        let normalizedValue = valueRange > 0 ? CGFloat((values[index] - minValue) / valueRange) : 0.5
                        let y = height - (normalizedValue * height)

                        VitalsGraphPointView(
                            value: values[index],
                            isInRange: isInRange,
                            valueText: String(format: "%.1f", values[index]),
                            showValue: false,
                            size: 14,
                            insideSize: 8,
                            inRangeColor: Color.blue,
                            outOfRangeColor: Color.orange,
                            showValueAbove: true
                        )
                        .position(x: x, y: y)
                    }
                }
                .padding(.leading, 35)
                .padding(.trailing, 35)
            }
            .frame(height: 80)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .padding(.vertical, 5)
    }
}
