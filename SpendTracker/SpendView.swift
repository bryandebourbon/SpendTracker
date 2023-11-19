import SwiftUI

struct SpendView: View {
  var spend: Int
  let maxSpend: Int = 100  // Assuming maximum spend value for gauge

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Circle()
          .trim(from: 0.0, to: 0.75)
          .stroke(Color.gray, lineWidth: 5)
          .frame(width: geometry.size.width, height: geometry.size.height)
          .rotationEffect(Angle(degrees: 135))

        GaugePointer(spend: spend, maxSpend: maxSpend)
          .frame(width: geometry.size.width, height: geometry.size.height)
          .rotationEffect(Angle(degrees: 225))
      }
    }
  }
}

struct GaugePointer: View {
  var spend: Int
  var maxSpend: Int

  var rotation: Double {
    // Convert spend value to angle
    Double(spend) / Double(maxSpend) * 270  // 270 because gauge is 3/4 of a circle
  }

  var body: some View {
    Rectangle()
      .frame(width: 2, height: 50)
      .offset(y: -25)
      .rotationEffect(Angle(degrees: rotation))
      .foregroundColor(.red)
  }
}

// Preview
struct SpendView_Previews: PreviewProvider {
  static var previews: some View {
    SpendView(spend: 0)  // Example spend value
      .frame(width: 100, height: 100)
  }
}
