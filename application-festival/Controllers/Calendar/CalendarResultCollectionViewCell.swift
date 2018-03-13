//
//  CalendarResultCollectionViewCell.swift
//  application-festival
//
//  Created by Erwann Letue on 15/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class CalendarResultCollectionViewCell: UICollectionViewCell {
	// Visual Effect content
	@IBOutlet weak var startingDateHourLabel: UILabel!
	@IBOutlet weak var startingDateMinuteLabel: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
	
	// Bottom content
    @IBOutlet weak var bottomContent: UIView!
    @IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var excerptLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
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
