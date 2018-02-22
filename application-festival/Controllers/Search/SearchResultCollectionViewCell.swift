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
}
