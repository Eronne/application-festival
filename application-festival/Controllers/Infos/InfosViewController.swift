//
//  InfosViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 21/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class InfosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var accordion: UITableView!
	
	private let itemsTitle = ["Tarif", "Se restaurer au TNB", "Lieux et accès", "Partenaires", "Crédits"]
	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = accordion.dequeueReusableCell(withIdentifier: "InfosViewCell", for: indexPath) as! InfosViewCell
		cell.titleItem.text = itemsTitle[indexPath.row]
        return cell
    }
	
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func clickAction(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "WebView", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "WebView")
		self.present(viewController, animated: true, completion: nil)
    }

}
