//
//  Data.swift
//  application-festival
//
//  Created by Circe Grand on 14/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class DateEvents: NSObject, NSCoding, Decodable {
	
	var year: Int!
	var month: Int!
	var day: Int!
	var hour: Int!
	var minute: Int!
	
	func getDateEvents() -> Foundation.Date {
		let formatter = DateFormatter()
		formatter.dateFormat = "YYYY-M-d H:m"
		formatter.timeZone = .current
		formatter.locale = Locale(identifier: "FR-fr")
		let string = "\(year!)-\(month!)-\(day!) \(hour!):\(minute!)"
		return formatter.date(from: string)!
	}
	
	func getDateEvents(withFormat format: String, withLocale locale: Locale? = .current) -> String {
		let formatter = DateFormatter()
		formatter.locale = locale
		formatter.setLocalizedDateFormatFromTemplate(format)
		return formatter.string(from: getDateEvents())
	}
	
	required init?(coder aDecoder: NSCoder) {
		self.year = aDecoder.decodeObject(forKey: "year") as! Int?
		self.month = aDecoder.decodeObject(forKey: "month") as! Int?
		self.day = aDecoder.decodeObject(forKey: "day") as! Int?
		self.hour = aDecoder.decodeObject(forKey: "hour") as! Int?
		self.minute = aDecoder.decodeObject(forKey: "minute") as! Int?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(year, forKey: "year")
		aCoder.encode(month, forKey: "month")
		aCoder.encode(day, forKey: "day")
		aCoder.encode(hour, forKey: "hour")
		aCoder.encode(minute, forKey: "minute")
	}

}
