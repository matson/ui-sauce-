//
//  CommonSliderView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//
import SwiftUI

struct CommonSliderView: View {

    @State var value: Double = 1
    @State var passedLimit: Bool = false
    private let minValue: Double = 0
    private let maxValue: Double = 10
    private var step: Double = 1

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(passedLimit ? ProjectColors.hotPink.opacity(0.7) :  ProjectColors.lightGray, lineWidth: 2.5)
                    .frame(width: 60, height: 40)
                Text("\(Int(value))")
                    .font(.custom("Roboto-Medium", size: 20))
                    .font(.caption)
            }
            .padding(.bottom, 30)

            GeometryReader { geometry in

                let knobSize: CGFloat = 40
                let accessoryKnobSize: CGFloat = 30
                let sliderHeight: CGFloat = 20

                ZStack(alignment: .leading){

                    Rectangle()
                        .fill(ProjectColors.lavender)
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
                            .frame(width: knobSize, height: knobSize)
                            .foregroundColor(.white)
                            .shadow(color: Color.blue.opacity(0.4), radius: 12, x: 0, y: 4)
                        Circle()
                            .frame(width: accessoryKnobSize, height: accessoryKnobSize)
                            .foregroundColor(ProjectColors.lightBlue)

                    }
                    .offset(x:position(for: value, in: geometry.size.width) - 15)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gesture in
                                updateValue(with: gesture, in: geometry)
                                passedLimit = value >= 5
                            }
                    )
                }
            }
            .padding(.horizontal, 40) // padding on ends of bar
            .frame(height: 40) // scale of geometry reader
        }
    }

    func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        let scaledValue = newValue * (maxValue - minValue) + minValue
        value = min(max(Double(scaledValue), minValue), maxValue)
    }

    private func position(for value: Double, in width: CGFloat) -> CGFloat {
        CGFloat((value - minValue) / (maxValue - minValue)) * width
    }
}


#Preview {
    CommonSliderView()
}
