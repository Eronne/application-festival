//
//  CalendarResultCollectionViewCell.swift
//  application-festival
//
//  Created by Erwann Letue on 15/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class CalendarResultCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var startingDateHourLabel: UILabel!
	@IBOutlet weak var startingDateMinuteLabel: UILabel!
	@IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var bottomContent: UIView!
    @IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var excerptLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
	
	@IBAction func favButtonTouch(_ sender: Any) {
		let index = favButton.tag
		print(index)
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favButtonTouched"), object: nil, userInfo: ["row":index])
	}
	
}
