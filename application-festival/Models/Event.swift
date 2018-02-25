//
//  Events.swift
//  application-festival
//
//  Created by Erwann Letue on 16/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class Event: NSObject, NSCoding, Decodable {
	var id: Int?;
	var name: String?;
	var excerpt: String?;
	var place: Place?;
	var category: String?;
	var img: String?;
	var startingDate: DateEvents;
	var endingDate: DateEvents;
	var duration: Duration?;
	
	required init?(coder aDecoder: NSCoder) {
		self.id = aDecoder.decodeObject(forKey: "id") as! Int?
		self.name = aDecoder.decodeObject(forKey: "name") as! String?
		self.excerpt = aDecoder.decodeObject(forKey: "excerpt") as! String?
		self.img = aDecoder.decodeObject(forKey: "img") as! String?
		self.place = aDecoder.decodeObject(forKey: "place") as! Place?
		self.category = aDecoder.decodeObject(forKey: "category") as! String?
		self.startingDate = aDecoder.decodeObject(forKey: "startingDate") as! DateEvents
		self.endingDate = aDecoder.decodeObject(forKey: "endingDate") as! DateEvents
		self.duration = aDecoder.decodeObject(forKey: "duration") as! Duration?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(id, forKey: "id")
		aCoder.encode(name, forKey: "name")
		aCoder.encode(excerpt, forKey: "excerpt")
		aCoder.encode(img, forKey: "img")
		aCoder.encode(place, forKey: "place")
		aCoder.encode(category, forKey: "category")
		aCoder.encode(startingDate, forKey: "startingDate")
		aCoder.encode(endingDate, forKey: "endingDate")
		aCoder.encode(duration, forKey: "duration")
	}
}



class Duration: NSObject, NSCoding, Decodable {
	
	var hour: Int?;
	var minute: Int?;
	
	required init?(coder aDecoder: NSCoder) {
		self.hour = aDecoder.decodeObject(forKey: "hour") as! Int?
		self.minute = aDecoder.decodeObject(forKey: "minute") as! Int?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(hour, forKey: "hour")
		aCoder.encode(minute, forKey: "minute")
	}
}

