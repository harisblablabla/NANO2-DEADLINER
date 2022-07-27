//
//  NC2App.swift
//  NC2
//
//  Created by Haris Fadhilah on 25/07/22.
//

import SwiftUI

@main
struct NC2App: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomePage()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
