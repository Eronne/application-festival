//
//  SearchCollectionViewCell.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
	
	var filter: Filter?
	var imageArray = [UIImage(named: "age"), UIImage(named: "day"), UIImage(named: "time"), UIImage(named: "place"), UIImage(named: "type")]
	var filterSelected = false;
	
	@IBOutlet weak var filterButton: UIButton!
	
	@IBAction func buttonTouchUp(_ sender: UIButton) {
		let imageIndex = filter?.filterType
		if filterButton.titleColor(for: .normal) == UIColor.white {
			print(filterButton.isTouchInside);
			filterButton.setBackgroundImage(nil, for: .normal);
			filterButton.setTitleColor(UIColor.black, for: .normal)
			filterSelected = false;
		} else {
			filterButton.setBackgroundImage(imageArray[imageIndex!], for: .normal);
			filterButton.setTitleColor(UIColor.white, for: .normal)
			filterSelected = true;
		}
	}
	
}
