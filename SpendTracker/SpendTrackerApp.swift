//
//  SpendGaugeApp.swift
//  SpendGauge Watch App
//
//  Created by Bryan de Bourbon on 11/18/23.
//

import SwiftUI

@main
struct SpendGauge_Watch_AppApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

struct ContentView: View {
  var body: some View {
    VStack {
      SpendInteracter()
    }
    .padding()
  }
}

#Preview{
  ContentView()
}
