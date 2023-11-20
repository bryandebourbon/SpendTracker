import SwiftUI
import WidgetKit

struct SpendInteracter: View {
  @State private var value: Int = 0
  @State private var spend: Int = 0

  init() {
    // Fetch the initial value from shared UserDefaults
    if let sharedDefaults = UserDefaults(suiteName: "group.com.bryandebourbon.spend") {
      _spend = State(initialValue: sharedDefaults.integer(forKey: "spend"))
    }
  }

  var body: some View {
    VStack {
      Text("Spend: \(spend)")

      Stepper(
        "\(value)",
        onIncrement: { self.value += 1 },
        onDecrement: { self.value -= 1 }
      )
      Button("Submit") {
        let newSpend = self.value + self.spend
        // Save to shared UserDefaults
        let sharedDefaults = UserDefaults(suiteName: "group.com.bryandebourbon.spend")
        sharedDefaults?.set(newSpend, forKey: "spend")

        // Update the local state to reflect the new spend
        self.spend = newSpend

        // Request widget refresh
        WidgetCenter.shared.reloadAllTimelines()
      }
    }
  }
}

// Preview
struct SpendInteracter_Previews: PreviewProvider {
  static var previews: some View {
    SpendInteracter()
  }
}
