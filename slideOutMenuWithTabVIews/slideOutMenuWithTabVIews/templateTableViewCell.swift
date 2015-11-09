//
//  templateTableViewCell.swift
//  slideOutMenuWithTabVIews
//
//  Created by guitarrkurt on 02/11/15.
//  Copyright © 2015 guitarrkurt. All rights reserved.
//

import UIKit

class templateTableViewCell: UITableViewCell {

    @IBOutlet weak var figura: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
