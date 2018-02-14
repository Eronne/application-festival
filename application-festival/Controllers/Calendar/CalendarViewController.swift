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
		
		// Install observers
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "CellTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let day = userInfo["day"] as? String {
					if let resultController = self.storyboard?.instantiateViewController(withIdentifier: "resultId") as? CalendarResultController {
						resultController.day = day
						print(resultController.day)
						self.present(resultController, animated: true, completion: nil)
					}
				}
			}
		}
		
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "closeCalendarResult"), object: nil, queue: nil) { (notif) in
			self.dismiss(animated: true, completion: nil)
		}

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
		
		cell.cellButton.tag = Int(daysArray[indexPath.row])!
 
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
