//
//  SearchCollectionViewCell.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var filterButton: UIButton!
	
	@IBAction func buttonTouchUp(_ sender: UIButton) {
		let index = filterButton.tag
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterButtonTouched"), object: nil, userInfo: ["row":index])
	}
	
}
