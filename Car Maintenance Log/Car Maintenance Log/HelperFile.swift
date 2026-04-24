//
//  HelperFile.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 4/14/26.
//

import Foundation

struct ServiceIconHelper {
    static func iconName(for serviceType: String) -> String {
        switch serviceType {
        case "Oil Change":
            return "drop.fill"
        case "Tire Rotation":
            return "circle.fill"
        case "Brake Service":
            return "exclamationmark.circle.fill"
        case "Battery":
            return "bolt.fill"
        case "Inspection":
            return "checkmark.seal.fill"
        default:
            return "wrench.and.screwdriver.fill"
        }
    }
}
