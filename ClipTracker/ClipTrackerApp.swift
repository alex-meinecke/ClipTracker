//
//  ClipTrackerApp.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import SwiftUI

@main
struct ClipTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
