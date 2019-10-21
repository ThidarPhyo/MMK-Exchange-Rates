//
//  RateTableViewCell.swift
//  MMK
//
//  Created by Thidar Phyo on 9/8/19.
//  Copyright © 2019 Thidar Phyo. All rights reserved.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flatImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        nameLabel.textColor = .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
