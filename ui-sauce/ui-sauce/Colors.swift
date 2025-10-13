//
//  Colors.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

// MARK: - Color File

enum ProjectColors {

    static let rainbowGradient: LinearGradient = .init(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]), startPoint: .leading, endPoint: .trailing)

    static let rainbowGradientSoft: LinearGradient = .init(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .leading, endPoint: .trailing)

    static let lightBlue = Color(red: 173/255, green: 216/255, blue: 230/255)

    static let lightGray = Color(red: 155/255, green: 182/255, blue: 191/255, opacity: 1.0)

    static let hotPink = Color(red: 255/255, green: 105/255, blue: 180/255)

    static let royalBlue = Color(red: 23 / 255, green: 99 / 255, blue: 178 / 255)

    static let royalBlueLite = Color(red: 23 / 255, green: 99 / 255, blue: 178 / 255).opacity(0.4)

    static let lavender = Color(red: 200 / 255, green: 180 / 255, blue: 230 / 255)

    static let redColor = Color.red

    static let newGreen = Color.green

    static let translucentGray = Color(red: 219/255, green: 219/255, blue: 219/255, opacity: 1.0)

    static let tealGradient: LinearGradient = .init(gradient: Gradient(colors: [.green, .teal]), startPoint: .top, endPoint: .bottom)

    static let purpleGradient: LinearGradient = .init(gradient: Gradient(colors: [.teal, .purple]), startPoint: .leading, endPoint: .trailing)

    static let graySolidGradient: LinearGradient = .init(gradient: Gradient(colors: [.gray, .gray]), startPoint: .top, endPoint: .bottom)

    static let vibrantBlue = Color(.sRGB, red: 0/255, green: 125/255, blue: 255/255, opacity: 1.0)

    static let brightOrange = Color(.sRGB, red: 240/255, green: 130/255, blue: 0/255, opacity: 1.0)

    static let tealGreen = Color(.sRGB, red: 1/255, green: 180/255, blue: 137/255, opacity: 1.0)

    static let tealGreenLight = Color(.sRGB, red: 102/255, green: 210/255, blue: 184/255, opacity: 1.0)

    static let greenGradient: LinearGradient = .init(gradient: Gradient(colors: [Color(.sRGB, red: 1/255, green: 180/255, blue: 137/255, opacity: 1.0), Color(.sRGB, red: 0/255, green: 135/255, blue: 90/255, opacity: 1.0)]), startPoint: .top,
                                                     endPoint: .bottom)

    static let whiteGradientSolid = LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .top, endPoint: .bottom)

    static let translucentNavy = Color(.sRGB,red: 23/255, green: 43/255, blue: 77/255, opacity: 0.3)

    static let darkNavy = Color(.sRGB, red: 23/255, green: 43/255, blue: 77/255, opacity: 1.0)

    static let dividerLightGray = Color(red: 223 / 255, green: 226 / 255, blue: 229 / 255)
}

enum Colors  {

    static let mediumBlue = Color(red: 64.0 / 255.0, green: 125.0 / 255.0, blue: 185.0 / 255.0, opacity: 1.0)
    static let lightBlue = Color(red: 227.0 / 255.0, green: 234.0 / 255.0, blue: 238.0 / 255.0, opacity: 1.0)
    static let newBlue = Color(red: 23 / 255, green: 99 / 255, blue: 178 / 255, opacity: 1)


    static let lightGray = Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255, opacity: 1)
    static let lightGray2 = Color(red: 232 / 255, green: 235 / 255, blue: 240 / 255, opacity: 1)
    static let lightGray3 = Color(red: 100 / 255, green: 116 / 255, blue: 139 / 255, opacity: 1)

    static let grayBlue = Color(red: 100 / 255, green: 116 / 255, blue: 139 / 255, opacity: 1)

    static let backgroundGray = Color(red: 185 / 255, green: 191 / 255, blue: 202 / 255, opacity: 0.17)

    static let unitCellGreen = Color(red: 1 / 255, green: 180 / 255, blue: 137 / 255, opacity: 0.77)

    static let unitCellYellow = Color(red: 254 / 255, green: 196 / 255, blue: 0 / 255, opacity: 1)

    static let unitCellRed = Color(red: 200 / 255, green: 60 / 255, blue: 60 / 255, opacity: 1)

    static let redColor = Color(red: 204/255, green: 53/255, blue: 60/255, opacity: 1)

    static let optionalGray = Color(red: 23 / 255, green: 43 / 255, blue: 77 / 255, opacity: 0.3)
    static let optionalGray2 = Color(red: 23 / 255, green: 43 / 255, blue: 77 / 255, opacity: 0.6)

    static let lightGreen = Color(red: 1/255, green: 180/255, blue: 137/255, opacity: 1)
    static let newGreen = Color(red: 0/255, green: 135/255, blue: 90/255, opacity: 1)
    static let buttonGray = Color(red: 244/255, green: 245/255, blue: 247/255, opacity: 1)
    static let checkBoxOrange = Color(red: 240/255, green: 130/255, blue: 0/255, opacity: 1)

    // gradient colors
    static let gradientGreenLeft = Color(red: 1/255, green: 180/255, blue: 137/255, opacity: 1)
    static let gradientGreenRight = Color(red: 0/255, green: 135/255, blue: 90/255, opacity: 1)

    static let greenGradient = LinearGradient(gradient: Gradient(colors: [gradientGreenLeft, gradientGreenRight]), startPoint: .leading, endPoint: .trailing)

    static let greenSolidGradient = LinearGradient(gradient: Gradient(colors: [darkGreen, darkGreen]), startPoint: .leading, endPoint: .trailing)
    static let graySolidGradient = LinearGradient(gradient: Gradient(colors: [optionalGray, optionalGray]), startPoint: .leading, endPoint: .trailing)
    static let darkGreen = Color(red: 0/255, green: 120/255, blue: 90/255, opacity: 1)
    static let cardWhite = Color(red: 223/255, green: 226/255, blue: 229/255, opacity: 0.3)
}
