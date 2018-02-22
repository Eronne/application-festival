//
//  SearchResultViewController.swift
//  application-festival
//
//  Created by Léa Tanda on 19/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var filterBy: String = ""
	var searchInName: String = ""
	var selectedFilters: [String: [String]] = [:]
	var filterListText: String = ""
	var events: [Event]? = nil
	
	@IBOutlet weak var filterList: UILabel!
	
    override func viewDidLoad() {
		super.viewDidLoad()
		if (filterBy == "search") {
			filterList.text = searchInName
			events = DataMapper().events.searchByName(name: searchInName)!
		} else {
			filterList.text = filterListText
			events = DataMapper().events
				.filterBy(locations: selectedFilters["location"]!)?
				.filterBy(categories: selectedFilters["category"]!)?
				.filterBy(times: selectedFilters["time"]!)?
				.filterBy(days: selectedFilters["day"]!);
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return events!.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as! SearchResultCollectionViewCell
		
		let event = events?[indexPath.row]
		cell.eventName.text = event?.name
		cell.excerpt.text = events?[indexPath.row].excerpt
		cell.time.text = event?.startingDate.hour.description
		cell.place.text = event?.place?.name
		cell.thumbnail.image = UIImage(named:(event?.img)!)
		
		return cell;
	}
	
	@IBAction func closeAction(_ sender: UIButton) {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeSearchResult"), object: nil)
	}
}
