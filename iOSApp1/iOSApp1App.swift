//
//  iOSApp1App.swift
//  iOSApp1
//
//  Created by Tassos Fergadiotis on 2025-01-27.
//

import SwiftUI

@main
struct iOSApp1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
