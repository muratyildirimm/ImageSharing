//
//  ViewController.swift
//  ImageSharing
//
//  Created by Murat Yıldırım on 4.05.2023.
//

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
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if error != nil {
          self.presentAlertWithTitleAndMessage(title: "Error", message: error?.localizedDescription ?? "Error, try again")
        } else {
          self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
      }
    } else {
      presentAlertWithTitleAndMessage(title: "Error", message: "Enter Email and Password")
    }
  }
  
  
  @IBAction func signUpButton(_ sender: Any) {
    // buradaki if let kullanımına bak ya da guard let
   
    if let email = emailTF.text, let password = passwordTF.text {
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if error != nil {
          self.presentAlertWithTitleAndMessage(title: "Error", message: error?.localizedDescription ?? "Error, try again")
        } else {
          self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
      }
    } else {
      presentAlertWithTitleAndMessage(title: "Error", message: "Enter Email and Password")
    }
   
   
    
    
    
  }
  // extension kullanarak bunu nasıl yapabilrsin onu arastır. ya da en azından baska sayfada. present derken problem oluyo o kısmı anlamadım
  func presentAlertWithTitleAndMessage(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
  
}

