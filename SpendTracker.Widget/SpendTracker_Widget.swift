import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), spend: 50)  // Example placeholder data
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = SimpleEntry(date: Date(), spend: fetchSpendValue())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let currentDate = Date()
    let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
    let spend = fetchSpendValue()

    let entry = SimpleEntry(date: currentDate, spend: spend)
    let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
    completion(timeline)
  }

  private func fetchSpendValue() -> Int {
    let sharedDefaults = UserDefaults(suiteName: "group.com.bryandebourbon.spend")
    return sharedDefaults?.integer(forKey: "spend") ?? -1
  }

}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let spend: Int
}

struct SpendWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {

    Text("\(entry.spend)")
      .containerBackground(for: .widget) {
        Color.black
      }

  }
}

@main
struct SpendWidget: Widget {
  let kind: String = "SpendWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      SpendWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Spend Widget")
    .description("Shows Spend.")
  }
}
#Preview{

  SpendWidgetEntryView(entry: SimpleEntry(date: Date(), spend: 50))
    .previewContext(WidgetPreviewContext(family: .accessoryCircular))
}
