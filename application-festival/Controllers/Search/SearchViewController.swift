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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		submitButton.backgroundColor = UIColor(hue: 0.6056, saturation: 0.02, brightness: 0.88, alpha: 1.0)
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
		let filter = DataMapper().filters[indexPath.row]
		cell.filterButton.setTitle(filter.name, for: .normal)
		cell.filterButton.layer.borderWidth = 2
		cell.filterButton.layer.borderColor = UIColor.black.cgColor
		cell.filterButton.layer.cornerRadius = CGFloat(20)
        cell.filterButton.tag = indexPath.row;
		cell.filter = filter

		return cell
	}
	
	@IBAction func validateButtonAction(_ sender: UIButton) {
		print("tap");
	}
	
    
}


