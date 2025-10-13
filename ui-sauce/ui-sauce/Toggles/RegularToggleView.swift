//
//  RegularToggleView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct RegularToggleView: View {

    @State var isOn: Bool = false
    @State var isOnColor = ProjectColors.brightOrange
    @State var isOffColor = Color.gray

    var body: some View {
        HStack {
            ZStack(alignment: isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(isOn ? isOnColor : isOffColor)
                    .frame(width: 52, height: 33)

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
    RegularToggleView()
}
