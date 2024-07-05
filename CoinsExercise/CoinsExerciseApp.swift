//
//  CoinsExerciseApp.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import SwiftUI

@main
struct CoinsExerciseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
         Home()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
