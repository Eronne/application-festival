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
	private var favorites : [Event] = []
	
	override func viewDidLoad() {
		events = DataMapper().events.findByDay(day: Int(day)!)
		
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "favButtonTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let row = userInfo["row"]	{
					let indexRow = row as! Int
					let indexPath = IndexPath.init(row: indexRow, section: 0)
					self.collectionView.reloadItems(at: [indexPath])
					//cell.favButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
					DataMapper().addFav(event: self.events![row])
					print(self.events![row])
					
				}
			}
		}
		
	}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarResultCollectionViewCell", for: indexPath) as! CalendarResultCollectionViewCell
		
		if DataMapper().isFav(event: events![indexPath.row]) {
			cell.favButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		} else {
			cell.favButton.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}
		
		cell.favButton.tag = indexPath.row
		cell.startingDateHourLabel.text = (events![indexPath.row].startingDate.hour?.description)! + "h"
		cell.startingDateMinuteLabel.text = events![indexPath.row].startingDate.minute?.description
		cell.backgroundImage.image = UIImage(named: events![indexPath.row].img!)
		cell.bottomContent.sizeToFit()
		cell.nameLabel.text = events![indexPath.row].name
		if events![indexPath.row].excerpt != "" {
			cell.excerptLabel.text = events![indexPath.row].excerpt
		} else {
			cell.excerptLabel.text = "Pas d'informations supplémentaires"
		}
		cell.durationLabel.text = (events![indexPath.row].duration?.hour?.description)! + "h" + (events![indexPath.row].duration?.minute?.description)!
		cell.placeLabel.text = events![indexPath.row].place!.name
		
		return cell
    }

    @IBAction func closeAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeCalendarResult"), object: nil)
    }
}
