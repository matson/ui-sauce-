//
//  GraphView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/15/25.
//

import SwiftUI



struct GraphView: View {

    // hardcoded values 
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let values = [5, 10, 3, 7, 4, 9]
    let maxValue = 10
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 4) {
                Text("Graph View")
                    .font(.inter(18, weight: .bold)) 
                    .foregroundStyle(Color(.black))
                
                Text("Depop Item Sales")
                    .font(.inter(15, weight: .light)) 
                    .foregroundStyle(Color(.gray))
            }
            
            // Month Labels Band & Graph Points Container
            VStack(spacing: 16) {

                VStack{
                    // Month Labels Band
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let pointSpacing = width / CGFloat(months.count - 1)

                        ForEach(0..<months.count, id: \.self) { index in
                            let x = CGFloat(index) * pointSpacing

                            Text(months[index])
                                .font(.inter(12, weight: .regular))
                                .foregroundStyle(Color(.gray))
                                .position(x: x, y: 10)
                        }
                    }
                    .frame(height: 20)

                    // Light Divider
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 1)
                }

                // Graph Points
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let pointSpacing = width / CGFloat(values.count - 1)
                    let minValue = values.min() ?? 0
                    let maxValueActual = values.max() ?? maxValue
                    
                    // Dotted lines for min and max values
                    let minY = height - (CGFloat(minValue) / CGFloat(maxValue) * height)
                    let maxY = height - (CGFloat(maxValueActual) / CGFloat(maxValue) * height)
                    
                    // Min value dotted line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: minY))
                        path.addLine(to: CGPoint(x: width, y: minY))
                    }
                    .stroke(ProjectColors.dividerLightGray, style: StrokeStyle(lineWidth: 1, dash: [5, 3]))

                    // Max value dotted line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: maxY))
                        path.addLine(to: CGPoint(x: width, y: maxY))
                    }
                    .stroke(ProjectColors.dividerLightGray, style: StrokeStyle(lineWidth: 1, dash: [5, 3]))
                    
                    // Fill area between dotted lines with gradient
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: maxY))
                        path.addLine(to: CGPoint(x: width, y: maxY))
                        path.addLine(to: CGPoint(x: width, y: minY))
                        path.addLine(to: CGPoint(x: 0, y: minY))
                        path.closeSubpath()
                    }
                    .fill(Colors.graphGradient)

                    // Connect the dots with lines
                    Path { path in
                        for index in 0..<values.count {
                            let x = CGFloat(index) * pointSpacing
                            let normalizedValue = CGFloat(values[index]) / CGFloat(maxValue)
                            let y = height - (normalizedValue * height)
                            
                            if index == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }
                    }
                    .stroke(Colors.skyLightBlue, lineWidth: 2)
                    
                    // Graph Points (for line connections)
                    ForEach(0..<values.count, id: \.self) { index in
                        let x = CGFloat(index) * pointSpacing
                        let normalizedValue = CGFloat(values[index]) / CGFloat(maxValue)
                        let y = height - (normalizedValue * height)
                        let isLastPoint = index == values.count - 1
                        
                        // Graph Point
                        ZStack {
                            Circle()
                                .fill(Colors.skyBlue)
                                .frame(width: 12.8, height: 12.8)
                            
                            Circle()
                                .fill(isLastPoint ? Colors.skyBlue : Color.white)
                                .frame(width: 8, height: 8)
                        }
                        .position(x: x, y: y)
                    }
                    
                    // Value Circles Below Points (separate layer)
                    ForEach(0..<values.count, id: \.self) { index in
                        let x = CGFloat(index) * pointSpacing
                        let normalizedValue = CGFloat(values[index]) / CGFloat(maxValue)
                        let pointY = height - (normalizedValue * height)
                        let circleY = pointY + 20 // offset below point
                        
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                .frame(width: 24, height: 24)
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                            
                            Text("\(values[index])")
                                .font(.inter(12, weight: .bold))
                                .foregroundStyle(Colors.skyBlue)
                        }
                        .position(x: x, y: circleY)
                    }
                }
                .frame(height: 120)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview{
    GraphView()
}
