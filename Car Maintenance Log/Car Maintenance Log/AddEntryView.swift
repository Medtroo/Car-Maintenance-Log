//
//  AddEntryView.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftUI
import SwiftData

struct AddEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var carName = ""
    @State private var selectedCategory: ServiceCategory = .oilChange
    @State private var mileage = ""
    @State private var mileageUnit = "mi"
    @State private var selectedDate = Date()
    @State private var notes = ""
    @State private var cost = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Car Info") {
                    TextField("Car Name", text: $carName)

                    Picker("Service Category", selection: $selectedCategory) {
                        ForEach(ServiceCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }

                Section("Details") {
                    TextField("Mileage", text: $mileage)
                        .keyboardType(.numberPad)

                    Picker("Mileage Unit", selection: $mileageUnit) {
                        Text("Miles").tag("mi")
                        Text("KM").tag("km")
                    }
                    .pickerStyle(.segmented)

                    TextField("Cost", text: $cost)
                        .keyboardType(.decimalPad)

                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                }

                Section("Notes") {
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle(AppStrings.addEntry)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(Color.appSecondaryText)
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveEntry()
                    }
                    .disabled(carName.isEmpty || mileage.isEmpty || cost.isEmpty)
                    .tint(Color.appAccentBlue)
                }
            }
        }
        .tint(Color.appAccentBlue)
    }

    private func saveEntry() {
        let newEntry = MaintenanceEntry(
            carName: carName,
            serviceType: selectedCategory.rawValue,
            mileage: Int(mileage) ?? 0,
            date: selectedDate,
            notes: notes,
            cost: Double(cost) ?? 0,
            mileageUnit: mileageUnit
        )

        modelContext.insert(newEntry)
        dismiss()
    }
}
