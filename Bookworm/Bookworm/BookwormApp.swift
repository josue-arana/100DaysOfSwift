//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Josue on 5/28/22.
//Iloveyouuuusoooomuch//my lovey//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
    
}
