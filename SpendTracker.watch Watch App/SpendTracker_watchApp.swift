//
//  SpendTracker_watchApp.swift
//  SpendTracker.watch Watch App
//
//  Created by Bryan de Bourbon on 11/18/23.
//

import SwiftUI

@main
struct SpendTracker_watch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
      SpendInteracter()
    }
}

#Preview {
    ContentView()
}
