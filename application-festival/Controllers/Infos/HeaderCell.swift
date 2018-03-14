//
//  HeaderCell.swift
//  application-festival
//
//  Created by Erwann Letue on 14/03/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("hello")
    }

}
