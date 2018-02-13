//
//  FavViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 21/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class FavViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var labelName: UILabel!

//	var imageArrayTest = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4")]
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCollectionViewCell", for: indexPath) as! FavCollectionViewCell
		
		cell.thumbnail.image = UIImage(named:"placeholder")
		
		// Todo: add singleton
		let event = DataMapper().events[indexPath.row]
		cell.title.text = event.name
		
		if(event.excerpt != "" ) {
			cell.author.text = event.excerpt
		} else {
			cell.author.text = "Pas d'informations supplémentaires"
		}

		cell.place.text = event.place?.name
		
		var minutes = ""
		
		if((event.duration?.minute)! < 10) {
			print("test duration minutes")
			minutes = "0" + (event.duration?.minute?.description)!
		}
		else {
			minutes = (event.duration?.minute?.description)!
		}
		
		let hours = (event.duration?.hour?.description)! + "h" + minutes
		cell.hours.text = hours
		
		print(hours)
		
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
