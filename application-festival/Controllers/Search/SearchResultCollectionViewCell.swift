//
//  SearchResultCollectionViewCell.swift
//  application-festival
//
//  Created by Léa Tanda on 20/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var eventName: UILabel!
	@IBOutlet weak var excerpt: UILabel!
	@IBOutlet weak var time: UILabel!
	@IBOutlet weak var place: UILabel!
	@IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var category: UILabel!
	@IBOutlet weak var searchFavButton: UIButton!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
	@IBOutlet weak var duration: UILabel!
	
	@IBAction func searchFavButtonTouchUp(_ sender: Any) {
		let index = searchFavButton.tag
		let event = DataMapper().events.findOneBy(id:index)
		if DataMapper().isFav(event: event!) {
			print("remove fav")
			DataMapper().removeFav(event: event!)
			searchFavButton.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}
		else if !DataMapper().isFav(event: event!) {
			print("add fav")
			DataMapper().addFav(event: event!)
			searchFavButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		}
	}
	
}
