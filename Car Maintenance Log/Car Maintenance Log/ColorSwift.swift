//
//  ColorSwift.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64

        switch hex.count {
        case 6:
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }

    static let appBackground = Color(hex: "D1D1D1")
    static let appPrimary = Color(hex: "080357")
    static let appAccentBlue = Color(hex: "0496FF")
    static let appSecondaryText = Color(hex: "636363")
    static let appCardDark = Color(hex: "4C4C4C")
    static let appAccentPurple = Color(hex: "623CEA")
    static let appTextPrimary = Color(hex: "0A014F")

    static let appCard = Color.white
    static let appBorder = Color(hex: "636363").opacity(0.25)
}
