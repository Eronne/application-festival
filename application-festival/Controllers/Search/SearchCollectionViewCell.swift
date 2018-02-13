//
//  SearchCollectionViewCell.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
	
	var imageArray = [UIImage(named: "age"), UIImage(named: "day"), UIImage(named: "time"), UIImage(named: "place"), UIImage(named: "type")]
	
	@IBOutlet weak var filterButton: UIButton!
	
	@IBAction func filterButtonAction(_ sender: UIButton) {
		
		
		
//		let imageIndex = DataMapper().filters[indexPath.row].filterType
//		cell.filterButton.setBackgroundImage(imageArray[imageIndex!], for: .focused);
//		print(filterButton.tag);
		
	}
}
