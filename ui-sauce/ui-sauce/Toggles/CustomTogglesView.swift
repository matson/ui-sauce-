//
//  CustomTogglesView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct CustomTogglesView: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 40){

            RegularToggleView()

            MediumToggleView()

            ToggleStyle1View()

            ToggleStyle2View()

        }

    }

}

#Preview {
    CustomTogglesView()
}
