//
//  EntryRowView.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftUI

struct EntryRowView: View {
    let entry: MaintenanceEntry

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: ServiceIconHelper.iconName(for: entry.serviceType))
                .font(.title3)
                .foregroundStyle(Color.appAccentBlue)
                .frame(width: 36, height: 36)
                .background(Color.appAccentBlue.opacity(0.12))                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 6) {
                Text(entry.carName)
                    .font(.headline)
                    .foregroundStyle(Color.appTextPrimary)

                Text(entry.serviceType)
                    .foregroundStyle(Color.appSecondaryText)

                Text("\(entry.mileage) mi • \(String(format: "$%.2f", entry.cost))")
                    .font(.subheadline)
                .background(Color.appAccentBlue.opacity(0.12))
            }

            Spacer()
        }
        .padding(.vertical, 6)
    }
}
