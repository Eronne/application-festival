//
//  GeneralViewController.swift
//  application-festival
//
//  Created by Circe Grand on 14/03/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
	
    
    @IBOutlet weak var circleFavNumber: UIView!
    @IBOutlet weak var favNumber: UILabel!
    
	let events = DataMapper().getFav()


    override func viewDidLoad() {
        super.viewDidLoad()
        favNumber.text = String(events.count)
		
		circleFavNumber.layer.cornerRadius = circleFavNumber.frame.size.width/2
		circleFavNumber.clipsToBounds = true
		
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "closeCalendarResult"), object: nil, queue: nil) { (notif) in
			let events = DataMapper().getFav()
			self.favNumber.text = String(events.count)
		}
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "closeSearchResult"), object: nil, queue: nil) { (notif) in
			let events = DataMapper().getFav()
			self.favNumber.text = String(events.count)
			
		}
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "closeFav"), object: nil, queue: nil) { (notif) in
			let events = DataMapper().getFav()
			self.favNumber.text = String(events.count)
		}

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
