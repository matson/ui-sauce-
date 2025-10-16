//
//  ui_sauceApp.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/13/25.
//

import SwiftUI

// a lotta fonts 
extension Font {
    static func inter(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName = switch weight {
        case .light: "Inter18pt-Light"
        case .bold: "Inter18pt-Bold"
        default: "Inter18pt-Regular"
        }
        return .custom(fontName, size: size)
    }
    
    static func lato(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName = switch weight {
        case .light: "Lato-Light"
        case .bold: "Lato-Bold"
        default: "Lato-Regular"
        }
        return .custom(fontName, size: size)
    }
}



@main
struct ui_sauceApp: App {
    var body: some Scene {
        WindowGroup {
            CustomSlidersView()
        }
    }
}
