//
//  ViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 11/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


	// Controller
	//    @IBAction func clickAction(_ sender: Any) {
	//        let sb = UIStoryboard.init(name: "Storyboard2", bundle: nil)
	//		if let vc = sb.instantiateInitialViewController() {
	//			self.present(vc, animated: true, completion: nil)
	//		}
	//    }
	
	@IBAction func backAction(_ segue: UIStoryboardSegue) {
		print("Coucou")
	}
}

