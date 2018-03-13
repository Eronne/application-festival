//
//  InfosTableViewCell.swift
//  application-festival
//
//  Created by Circe Grand on 13/03/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import AEAccordion

class InfosTableViewCell: AccordionTableViewCell {
	
	
	static let reuseIdentifier = "InfosTableViewCell"
	
	@IBOutlet weak var headerView: UIView!
	@IBOutlet weak var detailView: UIView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var contentText: UILabel!
	
	// MARK: Override
	
	override func setExpanded(_ expanded: Bool, animated: Bool) {
		super.setExpanded(expanded, animated: animated)
		
		if animated {
			UIView.transition(with: detailView, duration: 0.3, animations: {
				self.detailView.isHidden = !expanded
			}, completion: nil)
		} else {
			detailView.isHidden = !expanded
		}
	}

}
