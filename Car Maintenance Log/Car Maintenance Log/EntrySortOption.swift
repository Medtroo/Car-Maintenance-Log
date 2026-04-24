//
//  EntrySortOption.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation

enum EntrySortOption: String, CaseIterable, Identifiable {
    case newest = "Newest"
    case oldest = "Oldest"
    case highestCost = "Highest Cost"
    case highestMileage = "Highest Mileage"

    var id: String { rawValue }
}
