//
//  FavViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 21/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class FavViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var flowLayout: UPCarouselFlowLayout!
    @IBOutlet weak var favTitle: UILabel!
	@IBOutlet weak var noFavorite: UIView!
	@IBOutlet weak var noFavoritePlaceholder: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
	
	var lastContentOffset: CGFloat = 0
	var events = DataMapper().getFav()
	
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if (self.lastContentOffset < scrollView.contentOffset.y) {
			favTitle.isHidden = true
		} else if (self.lastContentOffset > scrollView.contentOffset.y) {
			favTitle.isHidden = false
		}
	}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return events.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCollectionViewCell", for: indexPath) as! FavCollectionViewCell
		let event = events[indexPath.row]
		cell.buttonFav.tag = event.id!
	
		
		//THUMBNAIL
		cell.thumbnail.image = UIImage(named: event.getImgName() )
		
		//CATEGORY
		cell.category.text = event.category?.uppercased()
		
		//TITLE
		cell.title.text = event.name?.uppercased()
		
		//AGE
		let ageNumber = "\(event.age ?? 0)"
		var age = ""
		if (ageNumber != "0") {
			age = "Age : \(ageNumber) ans"
		} else {
			age = "Ce programme convient à tous les âges"
		}
		cell.age.text = age
		
		//DIRECTOR
		if (event.director == "") {
			cell.director.text = "Aucun directeur associé"
			
		} else {
			cell.director.text = "Directeur(s): \(event.director ?? "")"
		}
		
		//PRODUCER
		if (event.director == "") {
			cell.producer.text = "Aucun producteur associé"
			
		} else {
			cell.producer.text = "Producteur(s): \(event.producer ?? "")"
		}
		
		
		//DESCRIPTION
		if(event.excerpt != "" ) {
			cell.exerpt.text = event.excerpt
		} else {
			cell.exerpt.text = "Pas d'informations supplémentaires"
		}

		//COUNTDOWN
		let eventStartingDate = event.startingDate.getDateEvents()
		let now = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
		let nowDateString = dateFormatter.string(from: now)
		let nowDate = dateFormatter.date(from: nowDateString)
		let components = Calendar.current.dateComponents([.month, .day, .hour, .minute], from: nowDate!, to: eventStartingDate)
		let countdown = "Débute dans \(components.day ?? 0)j \(components.hour ?? 0)h \(components.minute ?? 0)min"
		cell.countdown.text = countdown
		
		//PLACE
		cell.place.text = event.place?.name
		
		
		//DURATION
		cell.duration.text = "Durée: \(event.getDuration())"
		
		//HOURS
		let startingHour = event.getFullStartingHour()
		let endingHour = event.getFullEndingHour()
		cell.hours.text = "\(startingHour) - \(endingHour)"

		return cell
	
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		noFavorite.layer.borderWidth = 2;
		noFavorite.layer.borderColor = UIColor.black.cgColor;
		
		if events.count == 0 {
			noFavoritePlaceholder.text = "Vous n'avez ajouté aucun programme à vos favoris"
		} else {
			noFavorite.isHidden = true;
		}
		flowLayout.spacingMode = .overlap(visibleOffset: 50)
        // Do any additional setup after loading the view.
	
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "touchFavButton"), object: nil, queue: nil) { (notif) in
			self.collectionView.reloadData()
			self.events = DataMapper().getFav()
			print("reload")
		}
		
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
