//
//  SearchViewController.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
	
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
	
	var filters = DataMapper().filters;
	var imageArray = [UIImage(named: "age"), UIImage(named: "day"), UIImage(named: "time"), UIImage(named: "place"), UIImage(named: "type")];
	var isFilled = false;
	var filterBy = "filters";
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Add round borders to searchField
        searchField.layer.borderWidth = 2;
        searchField.layer.borderColor = UIColor.black.cgColor;
		
		//Prevents submitButton from being tapped
		validateForm(valid: false);

		//Notification on one filter touched
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "filterButtonTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo {
				if let row = userInfo["row"]	{
					let index = row as! Int
					self.filters[index].isSelected = !self.filters[index].isSelected
					let indexPath = IndexPath.init(row: index, section: 0)
					self.collectionView.reloadItems(at: [indexPath])
					
					//Check if at least a filter is selected
					for i in 0...self.filters.count-1 {
						if (self.filters[i].isSelected) {
							self.isFilled = true;
							self.validateForm(valid: true);
							break
						} else {
							self.isFilled = false;
							self.validateForm(valid: false);
						}
					}
				}
			}
		}
		
		//Open searchResultViewController if form is validated
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "filtersFormSubmitted"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let resultController = self.storyboard?.instantiateViewController(withIdentifier: "searchResultId") as? SearchResultViewController {
					resultController.filterBy = userInfo["filterBy"] as! String
					resultController.selectedFilters = userInfo["selectedFilters"] as! [String: [String]]
					resultController.searchInName = userInfo["searchInName"] as! String
					resultController.filterListText = userInfo["filtersList"] as! String
					self.present(resultController, animated: true, completion: nil)
				}
			}
		}
		
		//Close searchResultViewController when button close is taped
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "closeSearchResult"), object: nil, queue: nil) { (notif) in
			self.dismiss(animated: true, completion: nil)
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
		
		//If filter is selected change appearance
		if filter.isSelected == true {
			cell.filterButton.setBackgroundImage(imageArray[filter.imageIndex!], for: .normal);
			cell.filterButton.setTitleColor(UIColor.white, for: .normal)
		} else {
			cell.filterButton.setBackgroundImage(nil, for: .normal)
			cell.filterButton.setTitleColor(UIColor.black, for: .normal)
		}
		
		return cell
	}

	//Closes keyboard on return and handles search
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		validateSearchName()
		return true
	}
	
	//Close keyboard on screen tap and handles search
	override func touchesBegan(_: Set<UITouch>, with event: UIEvent?) {
		searchField.resignFirstResponder()
		self.view.endEditing(true)
		validateSearchName();
	}
	
	//If search is filled, handles it
	func validateSearchName() {
		if (!(searchField.text?.isEmpty)!) {
			isFilled = true
			filterBy = "search"
			validateForm(valid: true)
		} else {
			validateForm(valid: false)
		}
	}
	
	//Changes submit button color if is valid and allows touch action
	func validateForm(valid: Bool) {
		if valid {
			submitButton.backgroundColor = UIColor(hue: 0.4611, saturation: 1, brightness: 0.66, alpha: 1.0)
			submitButton.setTitleColor(UIColor.white, for: .normal)
			submitButton.isUserInteractionEnabled = true
		} else {
			submitButton.backgroundColor = UIColor(hue: 0.475, saturation: 0, brightness: 0.61, alpha: 1.0)
			submitButton.setTitleColor(UIColor(hue: 0.4861, saturation: 0, brightness: 0.36, alpha: 1.0), for: .normal)
			submitButton.isUserInteractionEnabled = false
		}
    }
	
	//Handles submit action
	@IBAction func submitAction(_ sender: UIButton) {
		
		var selectedFilters : [String: [String]] = [
			"age" : [],
			"category" : [],
			"time" : [],
			"day" : [],
			"location" : []
		];
		
		var filtersList : String = "";
		
		//Retrieve selected filters Ids
		for i in 0...self.filters.count-1 {
			let activeFilter = filters[i];
			if (activeFilter.isSelected) {
				filterBy = "filters";
				selectedFilters[activeFilter.filterType!]?.append(activeFilter.filterValue!)
				filtersList += activeFilter.name! + ", "
			}
		}
		
		print(filtersList)

		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filtersFormSubmitted"), object: nil, userInfo: ["filterBy": filterBy, "searchInName" : searchField.text!, "selectedFilters": selectedFilters, "filtersList": filtersList]);
	}
	
    
}


