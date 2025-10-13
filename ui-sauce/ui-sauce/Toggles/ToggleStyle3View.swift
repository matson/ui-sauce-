//
//  ToggleStyle3View.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//


import SwiftUI

struct MediumToggleView: View {

    @State var isOn: Bool = false
    @State var isOnColor: LinearGradient = ProjectColors.purpleGradient
    @State var isOffColor: LinearGradient = ProjectColors.graySolidGradient

    let vitalsTextSliderGray = Color(red: 177 / 255, green: 182 / 255, blue: 191 / 255)

    var body: some View {
        HStack {
            ZStack(alignment: isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(isOn ? isOnColor : isOffColor)
                    .frame(width: 100, height: 33)

                Circle()
                    .fill(Color.white)
                    .frame(width: 24, height: 24)
                    .shadow(radius: 1)
                    .padding([.leading, .trailing], 3)
            }
            .animation(.easeInOut(duration: 0.2), value: isOn)
            .onTapGesture {
                isOn.toggle()
            }
        }
    }
}

#Preview{
    MediumToggleView()
}
