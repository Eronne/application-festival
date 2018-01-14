//
//  FavViewController.swift
//  application-festival
//
//  Created by LETUE Erwann on 21/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		if let path = Bundle.main.path(forResource: "categories", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
				do{
					
					let json =  try JSONSerialization.jsonObject(with: data, options: .allowFragments)

					let jsonDictionary =  json as! Dictionary<String,Any>
					
					//e.g to get person
					let categoryArr = jsonDictionary["categories"] as! Array<Dictionary<String,Any>>
					
					for category in categoryArr {
						
						print(category)
						
					}
				}catch let error{
					
					print(error.localizedDescription)
				}
				
			} catch let error {
				print(error.localizedDescription)
			}
		} else {
			print("Invalid filename/path.")
		}
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
