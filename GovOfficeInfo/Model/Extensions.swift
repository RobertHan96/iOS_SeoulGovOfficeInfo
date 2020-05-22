
import Foundation

extension Int {
    func setPreviousViewId(id : Int) -> [Office] {
        if id == 1 {
            return DatafetchManager.shared.guOffice
        } else {
            return DatafetchManager.shared.taxOffice
        }
    }
}

extension String {
     var localized: String {
           return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")

        }

}


