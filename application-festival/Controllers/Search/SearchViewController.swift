//
//  SearchViewController.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	@IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
	
	var filters = DataMapper().filters;
	var imageArray = [UIImage(named: "age"), UIImage(named: "day"), UIImage(named: "time"), UIImage(named: "place"), UIImage(named: "type")];
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		submitButton.backgroundColor = UIColor(hue: 0.6056, saturation: 0.02, brightness: 0.88, alpha: 1.0)
		
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "filterButtonTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let row = userInfo["row"]	{
					let index = row as! Int
					self.filters[index].isSelected = !self.filters[index].isSelected
					let indexPath = IndexPath.init(row: index, section: 0)
					self.collectionView.reloadItems(at: [indexPath])
					print(indexPath, self.filters[index].isSelected)
				}
			}
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return DataMapper().filters.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
		let filter = filters[indexPath.row]
		cell.filterButton.setTitle(filter.name, for: .normal)
		cell.filterButton.layer.borderWidth = 2
		cell.filterButton.layer.borderColor = UIColor.black.cgColor
        cell.filterButton.tag = indexPath.row;
		
		print(indexPath.row)
		
		if filter.isSelected == true {
			cell.filterButton.setBackgroundImage(imageArray[filter.filterType!], for: .normal);
			cell.filterButton.setTitleColor(UIColor.white, for: .normal)
		} else {
			cell.filterButton.setBackgroundImage(nil, for: .normal)
			cell.filterButton.setTitleColor(UIColor.black, for: .normal)
		}
		
		return cell
	}
	
	@IBAction func validateButtonAction(_ sender: UIButton) {
		var i: Int;
		for i in 0...filters.count-1 {
			print(filters[i].name!, filters[i].isSelected);
		}
		
		submitButton.backgroundColor = UIColor(hue: 0.4611, saturation: 1, brightness: 0.66, alpha: 1.0)
		submitButton.setTitleColor(UIColor.white, for: .normal)

	}
	
    
}


