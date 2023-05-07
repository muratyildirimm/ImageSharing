//
//  FeedCell.swift
//  ImageSharing
//
//  Created by Murat Yıldırım on 7.05.2023.
//

import UIKit

class FeedCell: UITableViewCell {

  @IBOutlet weak var emailLabel: UILabel!
  
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var commentLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
