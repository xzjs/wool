//
//  woolApp.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI

@main
struct woolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
