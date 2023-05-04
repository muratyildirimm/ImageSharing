//
//  SettingsViewController.swift
//  ImageSharing
//
//  Created by Murat Yıldırım on 4.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  @IBAction func exitButton(_ sender: Any) {
    performSegue(withIdentifier: "toViewController", sender: nil)
  }
  

}
