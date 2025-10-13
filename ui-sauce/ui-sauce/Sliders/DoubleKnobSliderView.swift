import Foundation
import SwiftUI

struct DoubleKnobSliderView: View {

    var minValue: Double = 0.0
    var maxValue: Double = 10.0
    var stepSize: Double = 1.0
    var startingupperLimit: Double = 8.0
    var startinglowerLimit: Double = 3.0
    @State private var firstPosition: CGFloat = 2.0
    @State private var secondPosition: CGFloat = 1.0
    @State private var totalScreen: CGFloat = 100.0
    @State private var isDraggingFirst = false
    @State private var isDraggingSecond = false
    @State private var sliderHeight: CGFloat = 20.0
    let offsetValue: CGFloat = 0

    var greenOffset: Double {
        return min(firstPosition, secondPosition)
    }

    var greenWidth: Double {
        let min = min(firstPosition, secondPosition)
        let max = max(firstPosition, secondPosition)
        return max - min
    }

    var firstValue: Double {
        return map(value: firstPosition, from: 0...totalScreen, to: minValue...maxValue, stepSize: stepSize)
    }

    var secondValue: Double {
        return map(value: secondPosition, from: 0...totalScreen, to: minValue...maxValue, stepSize: stepSize)
    }

    // holds final values
    var lowerLimit: Double {
        let value = min(firstPosition, secondPosition)
        return map(value: value, from: 0...totalScreen, to: minValue...maxValue, stepSize: stepSize)
    }

    var upperLimit: Double {
        let value = max(firstPosition, secondPosition)
        return map(value: value, from: 0...totalScreen, to: minValue...maxValue, stepSize: stepSize)
    }

    var body: some View {
        VStack(spacing: 40){
            HStack(){
                Text("\(Int(lowerLimit))")
                    .font(.custom("Roboto-Medium", size: 20))
                    .padding(.horizontal, 35)
                    .padding(.vertical, 17)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(ProjectColors.lightGray, lineWidth: 2)
                    )

                Rectangle()
                    .fill(ProjectColors.translucentGray).opacity(0.2)
                    .frame(width: 2, height: 65)
                    .padding(.horizontal, 100)

                Text("\(Int(upperLimit))")
                    .font(.custom("Roboto-Medium", size: 20))
                    .padding(.horizontal, 35)
                    .padding(.vertical, 17)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(ProjectColors.lightGray, lineWidth: 2)
                    )

            }
            GeometryReader { geometry in
                VStack {
                    ZStack(alignment: .leading) {
                        // red color
                        Rectangle()
                            .fill(Colors.redColor.opacity(0.9))
                            .frame(height: sliderHeight)
                            .cornerRadius(15)
                            .accessibilityIdentifier("SliderView.redRectangleView")
                        // green color
                        Rectangle().foregroundStyle(Colors.newGreen)
                            .frame(width: greenWidth, height: sliderHeight)
                            .offset(x: greenOffset)
                            .accessibilityIdentifier("SliderView.greenRectangleView")
                        DraggableCircle(isDragging: $isDraggingFirst, position: $firstPosition, limit: totalScreen, arrowImage: "chevron.left")
                            .accessibilityElement(children: .contain)
                            .accessibilityIdentifier("SliderView.firstDraggableCircleView")
                        DraggableCircle(isDragging: $isDraggingSecond, position: $secondPosition, limit: totalScreen, arrowImage: "chevron.right")
                            .accessibilityElement(children: .contain)
                            .accessibilityIdentifier("SliderView.secondDraggableCircleView")
                        ValueBox(isDragging: isDraggingFirst, value: Int(firstValue), position: firstPosition)
                            .accessibilityElement(children: .contain)
                            .accessibilityIdentifier("SliderView.firstValueBox")
                        ValueBox(isDragging: isDraggingSecond, value: Int(secondValue), position: secondPosition)
                            .accessibilityElement(children: .contain)
                            .accessibilityIdentifier("SliderView.secondValueBox")
                    }
                    .offset(y: 8)
                    HStack {
                        Text("\(Int(minValue))")
                            .font(.custom("Roboto-Medium", size: 20))
                            .foregroundStyle(Color.black)
                            .accessibilityIdentifier("SliderView.minValueLabel")
                        Spacer()
                        Text("\(Int(maxValue))")
                            .font(.custom("Roboto-Medium", size: 20))
                            .foregroundStyle(Color.black)
                            .accessibilityIdentifier("SliderView.maxValueLabel")
                    }
                }
                .onAppear {
                    totalScreen = geometry.size.width - offsetValue
                    // reset the limits to default values
                    firstPosition = map(value: CGFloat(startingupperLimit), from: minValue...maxValue, to: 0...totalScreen, stepSize: stepSize)
                    secondPosition = map(value: CGFloat(startinglowerLimit), from: minValue...maxValue, to: 0...totalScreen, stepSize: stepSize)
                }
            }
        }
        .padding(.horizontal, 25)
    }

    func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>, stepSize: Double) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound

        let scaledValue = (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
        let roundedValue = round(scaledValue / stepSize) * stepSize
        return CGFloat(roundedValue)
    }
}

struct DraggableCircle: View {

    @Binding var isDragging: Bool
    @Binding var position: CGFloat
    var limit: CGFloat
    var arrowImage: String

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundStyle(Color.white)
                .shadow(radius: 5)
                .accessibilityIdentifier("DraggableCircle.circleView")
            Image(systemName: arrowImage)
                .foregroundColor(Colors.lightBlue)
                .accessibilityIdentifier("DraggableCircle.arrowImage")
        }
        .offset(x: position - 35 / 2)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation {
                        isDragging = true
                    }
                    position = min(max(value.location.x, 0), limit)
                })
                .onEnded({ value in
                    withAnimation {
                        isDragging = false
                    }
                })
        )
    }
}

struct ValueBox: View {
    var isDragging: Bool
    var value: Int
    var position: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 60, height: 40)
                .foregroundStyle(isDragging ? .white : .clear)
                .shadow(radius: 5)
                .accessibilityIdentifier("ValueBox.rectangleView")
            Text("\(value)")
                .foregroundStyle(isDragging ? .black : .clear)
                .font(.custom("Roboto-Medium", size: 16))
                .accessibilityIdentifier("ValueBox.valueLabel")
        }
        .scaleEffect(isDragging ? 1 : 0.85)
        .offset(x: position - 60 / 2, y: -40)
    }
}

#Preview {
    DoubleKnobSliderView()
}
