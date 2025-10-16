//
//  ToggleStyle2View.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct ToggleStyle2View: View {

    @State var isOn: Bool = false
    @State var isOnColor = ProjectColors.tealGreenLight
    @State var isOffColor = Color.gray
    @State var barOffColor = ProjectColors.whiteGradientSolid
    @State var barOnColor = ProjectColors.greenGradient

    var body: some View {
        HStack {
            ZStack(alignment: isOn ? .trailing : .leading) {
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isOn ? ProjectColors.tealGreen: ProjectColors.translucentNavy)
                        .frame(width: 140, height: 60)

                    RoundedRectangle(cornerRadius: 30)
                        .fill(isOn ? barOnColor : barOffColor)
                        .frame(width: 130, height: 50)
                }

                ZStack{
                    Circle()
                        .fill(isOn ? isOnColor : ProjectColors.lightGray)
                        .frame(width: 55, height: 55)
                        .shadow(radius: 1)

                    Image(isOn ? "check" : "incomplete-small")
                            .resizable()
                            .frame(width: 30, height: 30)

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
    ToggleStyle2View()
}
