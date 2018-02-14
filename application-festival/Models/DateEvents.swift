//
//  Data.swift
//  application-festival
//
//  Created by Circe Grand on 14/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class DateEvents: Decodable {
	
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
}
