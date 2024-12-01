//
//  labo_4App.swift
//  labo_4
//
//  Created by Рамазан Алиев on 01.12.2024.
//

import SwiftUI

@main
struct labo_4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
