
import Foundation
import UIKit

extension UIViewController {
  // Burada opsiyonel olarak kullanmasam bir problem olur muydu? Sonuçta bu fonskiyonun
  // parametlerini ellerimle ben veriyorum. Kullanıcıyla hiç bir bağlantısı yok.
  func popupAlert(title: String?, message: String?, actionStyle: UIAlertAction.Style) {
    guard let title = title else { return }
    guard let message = message else { return }
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: title, style: actionStyle)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
}
