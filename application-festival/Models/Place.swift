//
//  Place.swift
//  application-festival
//
//  Created by Erwann Letue on 15/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class Place: NSObject, NSCoding, Decodable {
	
	var name: String?;
	var seats: String?;
	
	required init?(coder aDecoder: NSCoder) {
		self.name = aDecoder.decodeObject(forKey: "name") as! String?
		self.seats = aDecoder.decodeObject(forKey: "seats") as! String?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name, forKey: "name")
		aCoder.encode(seats, forKey: "seats")
	}
}
