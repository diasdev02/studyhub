//
//  studyhubApp.swift
//  studyhub
//
//  Created by Dias Akyshev on 13.11.2024.
//

import SwiftUI

@main
struct studyhubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Header()
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
