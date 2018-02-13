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
	@IBOutlet weak var image: UIImageView!
	
	static let identifier = "CalendarCollectionViewCell"
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
