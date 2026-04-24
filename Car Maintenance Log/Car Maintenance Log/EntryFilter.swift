//
//  EntryFilter.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation

enum EntryFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case oilChange = "Oil Change"
    case tires = "Tires"
    case brakes = "Brakes"
    case battery = "Battery"
    case inspection = "Inspection"
    case engine = "Engine"
    case other = "Other"

    var id: String { rawValue }
}
