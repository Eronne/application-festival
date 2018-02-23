//
//  FavCollectionViewCell.swift
//  application-festival
//
//  Created by GRAND Circé on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class FavCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var thumbnail: UIImageView!
	@IBOutlet weak var author: UILabel!
	@IBOutlet weak var hours: UILabel!
	@IBOutlet weak var place: UILabel!
	@IBOutlet weak var countdown: UILabel!
	@IBOutlet weak var buttonFav: UIButton!
	
	@IBAction func favButtonTouchUp(_ sender: Any) {
		print("test test test")
		let index = buttonFav.tag
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favButtonTouched"), object: nil, userInfo: ["row":index])
	}
	
}

