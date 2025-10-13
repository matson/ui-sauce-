//
//  ToggleStyle1View.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct ToggleStyle1View: View {

    @State var isOn: Bool = false
    @State var isOnColor: LinearGradient = ProjectColors.tealGradient
    @State var isOffColor: LinearGradient = ProjectColors.graySolidGradient

    let vitalsTextSliderGray = Color(red: 177 / 255, green: 182 / 255, blue: 191 / 255)

    var body: some View {
        HStack {
            ZStack(alignment: isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(isOn ? isOnColor : isOffColor)
                    .frame(width: 80, height: 30)
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width: 35, height: 35)
                        .shadow(radius: 1)
                    Circle()
                        .fill(isOn ? ProjectColors.vibrantBlue : Color.gray.opacity(0.5))
                        .frame(width: 25, height: 25)
                        .shadow(radius: 1)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: isOn)
            .onTapGesture {
                isOn.toggle()
            }
        }
    }
}

#Preview{
    ToggleStyle1View()
}
