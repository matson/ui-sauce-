//
//  RainbowStepSliderView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//
import SwiftUI

struct RainbowStepSliderView: View {

    let rainbowGradient: LinearGradient = .init(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]), startPoint: .leading, endPoint: .trailing)
    let rainbowGradientSoft: LinearGradient = .init(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .leading, endPoint: .trailing)

    @State var value: Double = 1
    // @State private var isDragging = false
    private let minValue: Double = 0
    private let maxValue: Double = 10
    private var step: Double = 1

    var body: some View {
        VStack{
            Text("\(Int(value))")
                .font(.custom("Roboto-Medium", size: 20))
                .font(.caption)
                .padding(.bottom)

            GeometryReader { geometry in

                let knobSize: CGFloat = 40
                let sliderHeight: CGFloat = 20

                ZStack(alignment: .leading){

                    Rectangle()
                        .fill(ProjectColors.rainbowGradientSoft)
                        .frame(width: geometry.size.width, height: sliderHeight)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        }
                        .opacity(0.8)

                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 4)

                    }
                    .offset(x: position(for: value, in: geometry.size.width) - 20)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gesture in
                                updateValue(with: gesture, in: geometry)
                            }
                    )
                }
            }
            .padding(.horizontal, 40) // padding on ends of bar
            .frame(height: 40) // scale of geometry reader
        }
    }

    func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let percentage = gesture.location.x / geometry.size.width
        let rawValue = percentage * (maxValue - minValue) + minValue

        // Round to nearest multiple of step
        let steppedValue = round(rawValue / step) * step

        value = min(max(steppedValue, minValue), maxValue)
    }

    private func position(for value: Double, in width: CGFloat) -> CGFloat {
        CGFloat((value - minValue) / (maxValue - minValue)) * width
    }
}


#Preview {
    RainbowStepSliderView()
}
