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
	
	@IBOutlet weak var noEventsView: UIView!
	@IBOutlet weak var filterList: UILabel!
	@IBOutlet weak var newSearchButton: UIButton!
	@IBOutlet weak var collectionView: UICollectionView!
	
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
				.filterBy(days: selectedFilters["day"]!)?
				.filterBy(ages: selectedFilters["age"]!);
		}
		
		if events?.count != 0 {
			noEventsView.isHidden = true;
		} else {
			collectionView.isHidden = true;
			newSearchButton.layer.borderWidth = 2
			newSearchButton.layer.borderColor = UIColor.black.cgColor
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
		
		cell.searchFavButton.tag = (event?.id!)!
		if DataMapper().isFav(event: events![indexPath.row]) {
			print("etre fav")
			cell.searchFavButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		} else {
			cell.searchFavButton.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}
		
		cell.excerpt.text = event?.getTitle()
		cell.time.text = event?.getHours()
		cell.place.text = event?.place?.name
		cell.thumbnail.image = UIImage(named:(event?.getImgName())!)
		cell.category.text = event?.getCategory()
		cell.age.text = event?.getAge()
		cell.director.text = event?.getDirector()
		cell.producer.text = event?.getProducer()
		cell.duration.text = event?.getDuration()
		
		return cell;
	}
	
	@IBAction func closeAction(_ sender: UIButton) {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeSearchResult"), object: nil)
	}
	
	@IBAction func newSearch(_ sender: UIButton) {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeSearchResult"), object: nil)
	}
	
}
