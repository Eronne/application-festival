//
//  Categorie.swift
//  application-festival
//
//  Created by Erwann Letue on 15/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding, Decodable {
	
	var id: Int?;
	var name: String?;
	
	required init?(coder aDecoder: NSCoder) {
		self.id = aDecoder.decodeObject(forKey: "id") as! Int?
		self.name = aDecoder.decodeObject(forKey: "name") as! String?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(id, forKey: "id")
		aCoder.encode(name, forKey: "name")
	}
}
