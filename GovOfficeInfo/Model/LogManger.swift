import Foundation
import FirebaseAnalytics

func logSelectedItem(item : String?) {
    if let selectedItem = item {
        Analytics.logEvent("select", parameters: [
            AnalyticsParameterItemID: "\(selectedItem)",
            AnalyticsParameterItemName: selectedItem,
            AnalyticsParameterContentType: "cont"])
    }
}
