//
//  InfosViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 21/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class InfosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfosCollectionViewCell", for: indexPath) as! InfosCollectionViewCell

		return cell

	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickAction(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "WebView", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "WebView")
		self.present(viewController, animated: true, completion: nil)
    }

}
