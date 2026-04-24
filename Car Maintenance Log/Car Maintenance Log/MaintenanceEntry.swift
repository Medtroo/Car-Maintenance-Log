//
//  MaintenanceEntry.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation
import SwiftData

@Model
final class MaintenanceEntry {
    var carName: String
    var serviceType: String
    var mileage: Int
    var date: Date
    var notes: String
    var cost: Double
    var mileageUnit: String

    init(
        carName: String,
        serviceType: String,
        mileage: Int,
        date: Date,
        notes: String,
        cost: Double,
        mileageUnit: String
    ) {
        self.carName = carName
        self.serviceType = serviceType
        self.mileage = mileage
        self.date = date
        self.notes = notes
        self.cost = cost
        self.mileageUnit = mileageUnit
    }
}

