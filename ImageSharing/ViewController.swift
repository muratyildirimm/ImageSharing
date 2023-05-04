//
//  ViewController.swift
//  ImageSharing
//
//  Created by Murat Yıldırım on 4.05.2023.
//

import UIKit

class ViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func logInButton(_ sender: Any) {
  }
  
  
  @IBAction func signUpButton(_ sender: Any) {
    performSegue(withIdentifier: "toFeedVC", sender: nil)
  }
  
}

