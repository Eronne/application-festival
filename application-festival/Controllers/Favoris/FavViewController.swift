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
	
	
	var lastContentOffset: CGFloat = 0
	let events = DataMapper().getFav()
	
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
	
		cell.thumbnail.image = UIImage(named: event.getImgName() )
		cell.category.text = event.getCategory()
		cell.title.text = event.getTitle()
		cell.age.text = event.getAge()
		cell.director.text = event.getDirector()
		cell.producer.text = event.getProducer()
		cell.exerpt.text = event.getExcerpt()
		cell.place.text = event.place?.name
		cell.duration.text = event.getDuration()
		cell.hours.text = event.getHours()

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
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
