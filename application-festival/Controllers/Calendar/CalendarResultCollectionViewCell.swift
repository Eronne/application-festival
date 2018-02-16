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
	@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
}