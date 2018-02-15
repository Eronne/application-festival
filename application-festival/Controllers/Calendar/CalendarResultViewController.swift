//
//  CalendarResultController.swift
//  application-festival
//
//  Created by Erwann Letue on 14/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class CalendarResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var day: String = ""
	private var events: [Event]? = nil
	
	override func viewDidLoad() {
		events = DataMapper().events.findByDay(day: Int(day)!)
	}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarResultCollectionViewCell", for: indexPath) as! CalendarResultCollectionViewCell
		
		cell.startingDateHourLabel.text = (events![indexPath.row].startingDate.hour?.description)! + "h"
		cell.startingDateMinuteLabel.text = events![indexPath.row].startingDate.minute?.description
		cell.backgroundImage.image = UIImage(named: events![indexPath.row].img!)
		cell.nameLabel.text = events![indexPath.row].name
		cell.durationLabel.text = (events![indexPath.row].duration?.hour?.description)! + "h" + (events![indexPath.row].duration?.minute?.description)!
		cell.placeLabel.text = events![indexPath.row].place!.name
		
		return cell
    }

    @IBAction func closeAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeCalendarResult"), object: nil)
    }
}
