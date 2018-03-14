//
//  GeneralViewController.swift
//  application-festival
//
//  Created by Circe Grand on 14/03/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
	
	let events = DataMapper().getFav()

    override func viewDidLoad() {
        super.viewDidLoad()
		print(events.count)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
