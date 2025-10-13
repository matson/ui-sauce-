//
//  RangeSliderView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct RangeSliderView: View {


    @State var value: Double = 10
    private let step: Double = 5
    private let minValue: Double = 0
    private let maxValue: Double = 150
    private let rangeStart: Double = 50
    private let rangeEnd: Double = 100
    private let buttonSize: CGFloat = 45

    var body: some View {
        VStack{
            Text("\(Int(value))")
                .padding(.bottom)
                .font(.system(size: 20, weight: .bold, design: .default))

            HStack(alignment: .center, spacing: 0){
                // left button
                Button(action: {
                    value = max(value - step, minValue)
                }) {
                    ZStack{
                        Circle()
                            .tint(Color.white)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(
                                Circle()
                                    .stroke(Color.blue.opacity(0.2), lineWidth: 2.5)
                            )
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        Image("vitals-gray-left-arrow")
                            .resizable()
                            .frame(width: 8, height: 13)

                    }
                }

                GeometryReader { geometry in

                    let sliderHeight: CGFloat = 20 // slider height
                    let knobSize: CGFloat = 40 // slider knob size
                    let width = geometry.size.width

                    ZStack(alignment: .leading){
                        // track
                        RoundedRectangle(cornerRadius: 10)
                            .fill(ProjectColors.royalBlueLite)
                            .frame(height: sliderHeight)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(ProjectColors.lightGray, lineWidth: 2)
                            )

                        // range
                        Rectangle()
                            .fill(ProjectColors.royalBlue)
                            .frame(
                                width: position(for: rangeEnd, in: width) - position(for: rangeStart, in: width),
                                height: sliderHeight
                            )
                            .background(
                                Rectangle()
                                    .stroke(ProjectColors.lightGray, lineWidth: 2)
                            )
                            .offset(x: position(for: rangeStart, in: width))

                        // knob
                        ZStack{
                            Circle()
                                .frame(width: knobSize, height: knobSize)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 4)
                        }
                        .offset(x: position(for: value, in: geometry.size.width) - 20)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { gesture in
                                    updateValue(with: gesture, in: geometry)
                                }
                        )
                    }

                    ZStack {
                        Text("\(Int(rangeStart))")
                            .font(.custom("Roboto-Regular", size: 18))
                            .foregroundStyle(ProjectColors.lightGray)
                            .frame(width: 50)
                            .position(x: position(for: rangeStart, in: width), y: 10)

                        Text("\(Int(rangeEnd))")
                            .font(.custom("Roboto-Regular", size: 18))
                            .foregroundStyle(ProjectColors.lightGray)
                            .frame(width: 50)
                            .position(x: position(for: rangeEnd, in: width), y: 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding(.top, 40)
                }
                .padding(.horizontal, 30) // padding on ends of bar
                .frame(height: 40) // scale of geometry reader

                Button(action: {
                    value = min(value + step, maxValue)
                }) {
                    ZStack{
                        Circle()
                            .tint(Color.white)
                            .frame(width: buttonSize, height: buttonSize)
                            .background(
                                Circle()
                                    .stroke(ProjectColors.lightGray, lineWidth: 2.5)
                            )
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        Image("vitals-gray-right-arrow")
                            .resizable()
                            .frame(width: 8, height: 13)

                    }
                }
            }
        }
        .padding(.horizontal, 30)
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
    RangeSliderView()
}
