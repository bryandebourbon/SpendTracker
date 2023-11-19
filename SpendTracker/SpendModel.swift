import Foundation
class SpendModel {
    static let shared = SpendModel()

    private let key = "Spend"
    private let defaults: UserDefaults

    private init?() {
        guard let defaults = UserDefaults(suiteName: "com.bryandebourbon.spend") else { return nil }
        self.defaults = defaults
    }

    var spend: Int {
        get { defaults.integer(forKey: key) }
        set { defaults.set(newValue, forKey: key) }
    }
}
