//
//  CustomSlidersView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI


struct CustomSlidersView : View {

    var body : some View {
        ScrollView(){
            VStack(spacing: 150){

                CommonSliderView()

                RainbowStepSliderView()

                RangeSliderView()

                DoubleKnobSliderView()

            }
            .padding(.top, 40)
        }
    }
}
#Preview {
    CustomSlidersView()
}
