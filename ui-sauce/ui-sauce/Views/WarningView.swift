//
//  WarningView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//



import SwiftUI

struct WarningView: View {

    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea(edges: .all)
            VStack(alignment: .center){
                VStack{
                    Image("gray-accent")
                        .padding(.top, 10)

                    errorImage
                        .padding(.top, 5)
                }

                Spacer()

                VStack(alignment: .center, spacing: 10){

                    Text("Payment Failed")
                        .font(.custom("Lato-Bold", size: 16))

                    Text("Your Payment request could not be completed. Please try again.")
                        .multilineTextAlignment(.center)
                        .font(.custom("Lato-Regular", size: 14))
                        .foregroundStyle(ProjectColors.lightGray)
                }
                .padding(.bottom, 50)

            }
            .padding([.leading, .trailing])
            .frame(width: 350, height: 200)
            .background(Color.white)
            .cornerRadius(40)

        }


    }

    var errorImage: some View {
        ZStack{
            Image("ellipse-red")
            Image("red-circle")
            Image("incomplete-small")
        }
    }
}


#Preview {
    WarningView()
}
