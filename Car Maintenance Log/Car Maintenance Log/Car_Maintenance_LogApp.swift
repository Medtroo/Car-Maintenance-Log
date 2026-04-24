//
//  Car_Maintenance_LogApp.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 3/22/26.
//

import SwiftUI
import SwiftData

@main
struct Car_Maintenance_LogApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MaintenanceEntry.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
