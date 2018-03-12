//
//  CalendarResultController.swift
//  application-festival
//
//  Created by Erwann Letue on 14/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class CalendarResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var flowLayout: UPCarouselFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!

	var day: String = ""
	private var events: [Event]? = nil
	private var favorites : [Event] = []


    override func viewDidLoad() {
		flowLayout.spacingMode = .overlap(visibleOffset: 80)

		events = DataMapper().events.findByDay(day: Int(day)!)

		// Install observers
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "ResultCellTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let url = userInfo["url"] as? String {
					if let resultController = self.storyboard?.instantiateViewController(withIdentifier: "WebView") as? WebViewViewController {
						print(url)
//						resultController.day = day
						self.present(resultController, animated: true, completion: nil)
					}
				}
			}
		}

		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "favButtonTouched"), object: nil, queue: nil) { (notif) in
			if let userInfo = notif.userInfo	{
				if let row = userInfo["row"]	{
					let indexRow = row as! Int
					let indexPath = IndexPath.init(row: indexRow, section: 0)

					if DataMapper().isFav(event: self.events![indexPath.row]) {
						print("remove fav")
							DataMapper().removeFav(event: self.events![indexPath.row])
					}
//					else {
//						print("add fav")
//						DataMapper().addFav(event: self.events![indexPath.row])
//					}

					self.collectionView.reloadItems(at: [indexPath])

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
			print("etre fav")
			cell.favButton.setBackgroundImage(UIImage(named: "fav_actif.png"), for: .normal)
		} else {
			cell.favButton.setBackgroundImage(UIImage(named: "fav.png"), for: .normal)
		}

		cell.favButton.tag = events![indexPath.row].id!
		cell.startingDateHourLabel.text = (events![indexPath.row].startingDate.hour?.description)! + "h"
		cell.startingDateMinuteLabel.text = events![indexPath.row].startingDate.minute?.description
		cell.backgroundImage.image = UIImage(named: events![indexPath.row].getImgName())
		cell.bottomContent.sizeToFit()
		cell.nameLabel.text = events![indexPath.row].name
		if events![indexPath.row].excerpt != "" {
			cell.excerptLabel.text = events![indexPath.row].excerpt
		} else {
			cell.excerptLabel.text = "Pas d'informations supplémentaires"
		}
		cell.durationLabel.text = events![indexPath.row].getDuration()
		cell.placeLabel.text = events![indexPath.row].place!.name

		return cell
    }

    @IBAction func closeAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeCalendarResult"), object: nil)
    }
}
