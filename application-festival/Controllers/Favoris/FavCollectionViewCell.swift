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
		let index = buttonFav.tag
		let event = DataMapper().events.findOneBy(id:index)
		if DataMapper().isFav(event: event!) {
			print("remove fav")
			DataMapper().removeFav(event: event!)
			buttonFav.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}
		else if !DataMapper().isFav(event: event!) {
			print("add fav")
			DataMapper().addFav(event: event!)
			buttonFav.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		}
		
	}
	
}

