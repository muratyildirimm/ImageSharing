
import Foundation
import UIKit

extension UIViewController {
  func popupAlert(title: String?, message: String?, actionStyle: UIAlertAction.Style) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: title, style: actionStyle)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
}
