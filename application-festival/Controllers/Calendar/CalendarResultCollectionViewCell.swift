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

    @IBAction func CalendarResultCellTouched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ResultCellTouched"), object: nil, userInfo: ["url" : "http://festival-film-animation.fr/"])
    }

    @IBAction func favButtonTouch(_ sender: Any) {
		let index = favButton.tag
		let event = DataMapper().events.findOneBy(id:index)
		if DataMapper().isFav(event: event!) {
			print("remove fav")
			DataMapper().removeFav(event: event!)
			favButton.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}
		else if !DataMapper().isFav(event: event!) {
			print("add fav")
			DataMapper().addFav(event: event!)
			favButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		}
	}

}
