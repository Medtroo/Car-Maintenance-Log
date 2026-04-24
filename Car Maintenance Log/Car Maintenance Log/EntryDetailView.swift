//
//  EntryDetailView.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftUI


struct EntryDetailView: View {
    let entry: MaintenanceEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Text(entry.carName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.appTextPrimary)

                Image(systemName: ServiceIconHelper.iconName(for: entry.serviceType))
                    .font(.system(size: 40))
                    .foregroundStyle(Color.appAccentBlue)
                
                CategoryBadgeView(category: entry.serviceType)
                

                detailRow(title: "Mileage", value: "\(entry.mileage) mi")
                detailRow(title: "Cost", value: String(format: "$%.2f", entry.cost))
                detailRow(title: "Date", value: entry.date.formatted(date: .abbreviated, time: .omitted))

                if !entry.notes.isEmpty {
                    detailRow(title: "Notes", value: entry.notes)
                }
            }
            }
            .padding()
        }
       
    }

    @ViewBuilder
    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color.appSecondaryText)

            Text(value)
                .foregroundStyle(Color.appTextPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.appBorder, lineWidth: 1)
        )
    }
