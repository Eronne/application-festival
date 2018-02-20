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
	
	var lastContentOffset: CGFloat = 0
	
	
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		if (self.lastContentOffset < scrollView.contentOffset.y) {
			// moved to top
			print("moved to top")
		} else if (self.lastContentOffset > scrollView.contentOffset.y) {
			// moved to bottom
			print("moved to bottom")
		} else {
			// didn't move
		}
	}
	
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCollectionViewCell", for: indexPath) as! FavCollectionViewCell
		
		// Todo: add singleton
		let event = DataMapper().events[indexPath.row]
	
		
		cell.thumbnail.image = UIImage(named:event.img!)
		cell.title.text = event.name?.uppercased()
		
		if(event.excerpt != "" ) {
			cell.author.text = event.excerpt
		} else {
			cell.author.text = "Pas d'informations supplémentaires"
		}

		
		let eventStartingDate = event.startingDate.getDateEvents()
		let now = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
		let nowDateString = dateFormatter.string(from: now)
		let nowDate = dateFormatter.date(from: nowDateString)
		
		let components = Calendar.current.dateComponents([.month, .day, .hour, .minute], from: nowDate!, to: eventStartingDate)
		let countdown = "Débute dans \(components.month ?? 0)m \(components.day ?? 0)j \(components.hour ?? 0)h \(components.minute ?? 0)min"
		
		cell.countdown.text = countdown
		cell.place.text = event.place?.name
		
		var minutes = ""
		
		if((event.duration?.minute)! < 10) {
			minutes = "0" + (event.duration?.minute?.description)!
		}
		else {
			minutes = (event.duration?.minute?.description)!
		}
		
		let hours = (event.duration?.hour?.description)! + "h" + minutes
		cell.hours.text = hours

		
		return cell
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
