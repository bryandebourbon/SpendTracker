import SwiftUI

struct SpendInteracter: View {
  @State private var value: Int = 0
  @State private var spend: Int

  init() {
    // Assuming 0 as the default value for spend if SpendModel is unavailable
    self._spend = State(initialValue: SpendModel.shared?.spend ?? 0)
  }

  var body: some View {
    VStack {
      Text("Spend: \(spend)")

      Stepper(
        "Value: \(value)",
        onIncrement: { self.value += 1 },
        onDecrement: { self.value -= 1 }
      )
      Button("Submit") {
        let newSpend = self.value + self.spend
        SpendModel.shared?.spend = newSpend
        self.spend = newSpend
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
