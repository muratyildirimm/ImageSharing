//
//  SettingsViewController.swift
//  ImageSharing
//
//  Created by Murat Yıldırım on 4.05.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  @IBAction func exitButton(_ sender: Any) {
    do {
      try Auth.auth().signOut()
      performSegue(withIdentifier: "toViewController", sender: nil)
    } catch {
      print(error.localizedDescription)
    }
 
  }
  

}
