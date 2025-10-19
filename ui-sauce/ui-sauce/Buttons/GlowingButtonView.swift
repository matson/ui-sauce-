//
//  GlowingButtonView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/19/25.
//
import SwiftUI

struct GlowingButtonView: View{

    @State private var isAnimating = false


    var body: some View{
        ZStack{

            // background
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 50){

                ZStack{

                    // glowing background
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(AngularGradient(colors: [.teal, .purple, .blue, .pink, .teal], center: .center, angle: .degrees(isAnimating ? 360 : 0)))
                        .frame(width: 260, height: 60)
                        .blur(radius: 15)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)){
                                isAnimating = true
                            }
                        }

                    // button
                    Button {
                        // do the thing
                    } label: {
                        Text("BUY NOW")
                            .bold()
                            .font(.title3)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.black)
                            .frame(width: 260, height: 60)
                            .background(.teal, in: .rect(cornerRadius: 20, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                            }

                    }
                    ZStack{

                        Button {
                            // do the thing
                        } label: {
                            Text("BUY NOW")
                                .bold()
                                .font(.title3)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.black)
                                .frame(width: 260, height: 60)
                                .background(.teal, in: .rect(cornerRadius: 20, style: .continuous))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }

                        }
                    }
                }
                
                // Green glowing button
                ZStack{
                    // glowing background
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(AngularGradient(colors: [.green, .yellow, .orange, .pink, .green], center: .center, angle: .degrees(isAnimating ? 360 : 0)))
                        .frame(width: 260, height: 60)
                        .blur(radius: 25)

                    // button
                    Button {
                        // do the thing
                    } label: {
                        Text("GET STARTED")
                            .font(.robotoCondensed(20, weight: .bold))
                            .foregroundStyle(.black)
                            .frame(width: 260, height: 60)
                            .background(.green, in: .rect(cornerRadius: 20, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                            }
                    }
                }
                .padding(.top, 30)
            }
        }
    }
}

#Preview{

    GlowingButtonView()

}
