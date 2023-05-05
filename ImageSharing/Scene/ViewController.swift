
import UIKit
import Firebase

class ViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func logInButton(_ sender: Any) {
    if let email = emailTF.text, let password = passwordTF.text {
      // Sign in
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
        guard let strongSelf = self else {
          self?.popupAlert(title: "Title", message: "Message", actionStyle: .default)
          return
        }
        
        self?.performSegue(withIdentifier: "toFeedVC", sender: nil)
      }
    }
  }
  
  @IBAction func signUpButton(_ sender: Any) {
    if let email = emailTF.text, let password = passwordTF.text {
      // Create User
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if error != nil {
          self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
        } else {
          self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
      }
    } else {
      self.popupAlert(title: "Title", message: "Message", actionStyle: .default)
    }
  }
}
