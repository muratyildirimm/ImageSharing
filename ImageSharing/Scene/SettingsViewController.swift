
import UIKit
import Firebase

class SettingsViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func exitButton(_ sender: Any) {
    do {
      // We do this sign out operation in do catch because it can throw an error
      try Auth.auth().signOut()
      performSegue(withIdentifier: "toViewController", sender: nil)
    } catch {
      print(error.localizedDescription)
    }
  }
}
