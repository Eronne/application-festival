//
//  ImageCollectionViewCell.swift
//  application-festival
//
//  Created by Erwann Letue on 26/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var day: UILabel!
	@IBOutlet weak var dayLabel: UILabel!
	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var eventsCountsLabel: UILabel!
	@IBOutlet weak var cellButton: UIButton!
	
	static let identifier = "CalendarCollectionViewCell"
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	@IBAction func calendarCellTouched(_ sender: Any) {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CellTouched"), object: nil, userInfo: ["day" : "\(cellButton.tag)"])
	}
}
