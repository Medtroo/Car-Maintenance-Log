//
//  CategoryBadgeView.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftUI

struct CategoryBadgeView: View {
    let category: String

    var badgeColor: Color {
        switch category {
        case ServiceCategory.oilChange.rawValue:
            return Color.appAccentBlue
        case ServiceCategory.tires.rawValue:
            return Color.appAccentPurple
        case ServiceCategory.brakes.rawValue:
            return Color.appPrimary
        case ServiceCategory.battery.rawValue:
            return Color.green
        case ServiceCategory.inspection.rawValue:
            return Color.orange
        case ServiceCategory.engine.rawValue:
            return Color.red
        default:
            return Color.appSecondaryText
        }
    }

    var body: some View {
        Text(category)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(badgeColor)
            .clipShape(Capsule())
    }
}
