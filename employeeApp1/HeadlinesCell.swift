//
//  HeadlinesCell.swift
//  employeeApp1
//
//  Created by akbar  Rizvi on 4/2/20.
//  Copyright © 2020 akbar  Rizvi. All rights reserved.
//

import UIKit

class HeadlinesCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
