//
//  CalendarViewController.swift
//  application-festival
//
//  Created by Erwann Letue on 26/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var backgroundArray = [UIImage(named: "day1"), UIImage(named: "day2"), UIImage(named: "day3"), UIImage(named: "day4"), UIImage(named: "day5")]
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return backgroundArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
		
		cell.image.image = backgroundArray[indexPath.row]

		// Todo: add singleton
//		let place = DataMapper().places[indexPath.row]
		let event = DataMapper().events[indexPath.row]
		cell.title.text = event.excerpt
 
		return cell
		
		
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
