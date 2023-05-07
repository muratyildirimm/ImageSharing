
import UIKit
import Firebase

class SettingsViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  // Sign Out
  @IBAction func exitButton(_ sender: Any) {
    // We do this sign out operation in do-catch because it can throw an error
    do {
      try Auth.auth().signOut()
      performSegue(withIdentifier: "toViewController", sender: nil)
    } catch {
      print(error.localizedDescription)
    }
  }
}
