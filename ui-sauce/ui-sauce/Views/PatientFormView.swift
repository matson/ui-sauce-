//
//  PatientFormView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

struct PatientFormView: View {

    var genderOptions = ["f", "m"]
    @State var birthday: Date = Date()
    @State var placeholder: String = ""

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                HStack{
                    Text("Patient Form")
                        .font(.lato(25, weight: .bold))
                        .foregroundStyle(ProjectColors.darkNavy)
                        .padding(.leading, 30)
                    Spacer()
                    HStack(alignment: .center, spacing: 0){
                        Text("Form Complete Status:")
                            .font(.lato(18, weight: .bold))
                            .foregroundStyle(ProjectColors.darkNavy)
                        Image("incomplete-circle")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .shadow(color: .red.opacity(0.2), radius: 2, x: 2, y: 4)
                            .padding(.top, 5)

                    }
                    .padding(.trailing, 30)
                }
                .background(.white)
                .shadow(color: .black.opacity(0.02), radius: 15, x: 0, y: 4)
                VStack(spacing: 40){
                    HStack() {
                        Image("placeholder-image-background")
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .frame(width: 180, height: 180)
                        VStack(spacing:40){
                            VStack(alignment: .leading, spacing: 3){
                                Text("Last Name")
                                    .font(.lato(16, weight: .bold))
                                    .foregroundStyle(ProjectColors.darkNavy)
                                TextField("", text: $placeholder)
                                    .textFieldStyle(CheckInFieldStyle())
                            }
                            HStack(spacing: 30){
                                VStack(alignment: .leading, spacing: 3){
                                    Text("First Name")
                                        .font(.lato(16, weight: .regular))
                                        .foregroundStyle(ProjectColors.darkNavy)
                                    TextField("", text: $placeholder)
                                        .textFieldStyle(CheckInFieldStyle())
                                }
                                VStack(alignment: .leading, spacing: 3){
                                    Text("Middle Name")
                                        .font(.lato(16, weight: .regular))
                                        .foregroundStyle(ProjectColors.darkNavy)
                                    TextField("", text: $placeholder)
                                        .textFieldStyle(CheckInFieldStyle())
                                }
                            }
                        }
                        .padding(.leading, 35)
                    }.background(Color.white)
                    HStack(spacing:30){
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Insurance Policy Number")
                                .font(.lato(16, weight: .regular))
                                .foregroundStyle(ProjectColors.darkNavy)
                            TextField("", text: $placeholder)
                                .textFieldStyle(CheckInFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Primary Physician")
                                .font(.lato(16, weight: .regular))
                                .foregroundStyle(ProjectColors.darkNavy)
                            TextField("", text: $placeholder)
                                .textFieldStyle(CheckInFieldStyle())
                        }
                    }
                    HStack(spacing:30){
                        VStack(alignment: .leading, spacing: 3){
                            Text("Address")
                                .font(.lato(16, weight: .regular))
                                .foregroundStyle(ProjectColors.darkNavy)
                            TextField("", text: $placeholder)
                                .textFieldStyle(CheckInFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 3){
                            Text("State")
                                .font(.lato(16, weight: .regular))
                                .foregroundStyle(ProjectColors.darkNavy)
                            TextField("", text: $placeholder)
                                .textFieldStyle(CheckInFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 3){
                            Text("Zip")
                                .font(.lato(16, weight: .regular))
                                .foregroundStyle(ProjectColors.darkNavy)
                            TextField("", text: $placeholder)
                                .textFieldStyle(CheckInFieldStyle())
                        }

                    }
                    HStack(spacing: 30){
                        DropDownMenuView(options: genderOptions, placeholder: "Select Sex", selectedOption: $placeholder)
                        DropDownMenuView(options: genderOptions, placeholder: "Select Status", selectedOption: $placeholder)
                    }
                }
                .padding(.top, 30)
                .padding(.bottom, 70)
                .padding([.leading,.trailing], 30)

            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.05), radius: 14, x: 0, y: 4)

        }

    }
}


struct CheckInFieldStyle: TextFieldStyle {

    // universal field style for checkin screen
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 15)
            .padding(.vertical, 13)
            .font(.lato(16, weight: .regular))
            .autocapitalization(.none)
            .background(
                RoundedRectangle(cornerRadius: 1)
                    .stroke(ProjectColors.translucentNavy, lineWidth: 2)
                    .background(Color.clear) // Set background to clear

            )
    }

}



struct DropDownMenuView: View {

    let options: [String] // items passed in
    var placeholder: String // placeholder for each dropdown case
    @Binding var selectedOption: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                }) {
                    Text(option)
                }
            }
        }
    label: {
        HStack {

            Text(!selectedOption.isEmpty ? selectedOption : placeholder)
                .font(.lato(16, weight: .regular))
                .padding(.vertical, 15)
                .accentColor(.black)
                .padding(.leading, 13)

            Spacer()

            Image("chevron-down-gray")
                .padding(.trailing, 13)

        }
        .background(
            RoundedRectangle(cornerRadius: 1)
                .stroke(ProjectColors.translucentNavy, lineWidth: 4)
                .fill(Color.white)
        )
    }
}
}

struct BirthdayPickerView: View{

    @Binding var birthDate: Date
    // @ObservedObject var generalPatientInfoViewModel: DefaultGeneralPatientInfoViewModel

    var body: some View{

        HStack{
            Image(systemName: "photo")
                .padding()
            DatePicker("", selection: $birthDate, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .environment(\.locale, Locale(identifier: "en-US"))
                .padding(.horizontal, 15)
                .padding(.vertical, 6)
                .accentColor(.black)
                .font(.lato(16, weight: .regular))
                .cornerRadius(4.0)
                .onChange(of: birthDate) {
                    // generalPatientInfoViewModel.didBirthdayChange = true
                }


        }
        .background( // Add border here
            RoundedRectangle(cornerRadius: 4)
                .stroke(Colors.lightGray2, lineWidth: 2) // Set border color and width
                .fill(Color.white) // Fill the background with white
        )

    }
}


struct CheckInButtonStyle: ButtonStyle {

    var buttonWidth: CGFloat
    var buttonHeight: CGFloat

    // let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        let backgroundColor = Color.blue
        let pressedColor = Color.gray.opacity(0.5)
        let background = configuration.isPressed ? pressedColor : backgroundColor

        configuration.label
            .foregroundColor(.green)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .font(.lato(16, weight: .regular))
            .background(background)
            .cornerRadius(10)

    }
}

struct GrayCheckInButtonStyle: ButtonStyle {

    var buttonWidth: CGFloat
    var buttonHeight: CGFloat

    // let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        let backgroundColor = Color.blue
        let pressedColor = Color.gray.opacity(0.5)
        let background = configuration.isPressed ? pressedColor : backgroundColor

        configuration.label
            .foregroundColor(.green)
            .padding(.horizontal, 120)
            .padding(.vertical, 16)
            .font(.custom("Roboto-Medium", size: 15))
            .background(background)
            .cornerRadius(10)

    }
}

struct GreenCheckInButtonStyle: ButtonStyle {

    var buttonWidth: CGFloat
    var buttonHeight: CGFloat

    // let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        let backgroundColor = Color.blue
        let pressedColor = Color.gray.opacity(0.5)
        let background = configuration.isPressed ? pressedColor : backgroundColor

        configuration.label
            .foregroundColor(.green)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .font(.custom("Roboto-Medium", size: 15))
            .background(background)
            .cornerRadius(10)

    }
}


#Preview {
    PatientFormView()
}
