//
//  InfosTableViewController.swift
//  application-festival
//
//  Created by Circe Grand on 13/03/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import AEAccordion

final class InfosTableViewController: AccordionTableViewController {
	
	@IBOutlet weak var accordion: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		expandFirstCell()
	}
	
	func expandFirstCell() {
		let firstCellIndexPath = IndexPath(row: 0, section: 0)
		expandedIndexPaths.append(firstCellIndexPath)
	}
	
	// MARK: UITableViewDelegate
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return expandedIndexPaths.contains(indexPath) ? 200.0 : 50.0
	}
	
}
