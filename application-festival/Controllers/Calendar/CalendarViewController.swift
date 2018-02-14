//
//  CalendarViewController.swift
//  application-festival
//
//  Created by Erwann Letue on 26/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var flowLayout: UPCarouselFlowLayout!
	var backgroundArray = [UIImage(named: "day1"), UIImage(named: "day2"), UIImage(named: "day3"), UIImage(named: "day4"), UIImage(named: "day5")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		flowLayout.spacingMode = .overlap(visibleOffset: 20)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return backgroundArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
		
		let daysArray = ["4", "5", "6", "7", "8"]
		cell.day.text = daysArray[indexPath.row]
		cell.day.layer.shadowColor = UIColor.black.cgColor
		cell.day.layer.shadowRadius = 3.0
		cell.day.layer.shadowOpacity = 0.45
		cell.day.layer.shadowOffset = CGSize(width: 4, height: 4)
		cell.day.layer.masksToBounds = false
		
		cell.image.image = backgroundArray[indexPath.row]

//		let touch = UITapGestureRecognizer(target: cell, action: Selector(("tap:")))
//		touch.numberOfTapsRequired = 1
//		cell.addGestureRecognizer(touch)
 
		return cell
	}
	
	func tap(t: UITapGestureRecognizer) {
		print("TAP")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
