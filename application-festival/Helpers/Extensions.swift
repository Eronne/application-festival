//
//  Extensions.swift
//  application-festival
//
//  Created by Erwann Letue on 13/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import UIKit

extension UIView {
	@IBInspectable var shadow: Bool {
		get {
			return layer.shadowOpacity > 0.0
		}
		set {
			if newValue == true {
				self.addShadow()
			}
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return self.layer.cornerRadius
		}
		set {
			self.layer.cornerRadius = newValue
			
			// Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
			if shadow == false {
				self.layer.masksToBounds = true
			}
		}
	}
	
	
	func addShadow() {
		//Remove previous shadow views
		superview?.viewWithTag(119900)?.removeFromSuperview()
		
		//Create new shadow view with frame
		let shadowView = UIView(frame: frame)
		shadowView.tag = 119900
		shadowView.layer.shadowColor = UIColor.black.cgColor
		shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
		shadowView.layer.masksToBounds = false
		
		shadowView.layer.shadowOpacity = 0.1
		shadowView.layer.shadowRadius = 13
		shadowView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
		shadowView.layer.rasterizationScale = UIScreen.main.scale
		shadowView.layer.shouldRasterize = true
		
		superview?.insertSubview(shadowView, belowSubview: self)
	}
}

extension Array where Element == Event {
	func findBy(id: Int) -> [Event]? {
		return self.filter({ (event) -> Bool in
			return (event.id == id)
		})
	}
	
	func findOneBy(id: Int) -> Event? {
		return self.filter({ (event) -> Bool in
			return (event.id! == id)
		}).first
	}
	
	func findByDay(day: Int) -> [Event]? {
		return self.filter({ (event) -> Bool in
			return (event.startingDate.day! == day)
		})
	}
	
	func searchByName(name: String) -> [Event]? {
		return self.filter({ (event) -> Bool in
			return (event.name?.lowercased().contains(name.lowercased()))!
		})
	}
	
	func filterBy(locations: [String]) -> [Event]? {
		if (locations.count > 0){
			var result: [Event] = []
			locations.forEach { (location) in
				let results = self.filter({ (event) -> Bool in
					return event.place!.location?.lowercased() == location.lowercased()
				})
				result.append(contentsOf: results)
			}
			return result
		}
		return self
	}
	
	func filterBy(categories: [String]) -> [Event]? {
		if (categories.count > 0) {
			var result: [Event] = []
			categories.forEach { (category) in
				let results = self.filter({ (event) -> Bool in
					return event.category?.lowercased() == category.lowercased()
				})
				result.append(contentsOf: results)
			}
			return result
		}
		return self
	}
	
	func filterBy(times: [String]) -> [Event]? {
		if (times.count > 0) {
			var result: [Event] = []
			times.forEach { (time) in
				let results = self.filter({ (event) -> Bool in
					switch time {
						case "afternoon" :
							return event.startingDate.hour > 12 && event.startingDate.hour < 17
						case "night" :
							return event.startingDate.hour > 17
						default:
							return event.startingDate.hour < 12
					}
				})
				result.append(contentsOf: results)
			}
			return result
		}
		return self
	}
	
	func filterBy(days: [String]) -> [Event]? {
		if (days.count > 0) {
			var result: [Event] = []
			days.forEach { (day) in
				let results = self.filter({ (event) -> Bool in
					return event.startingDate.day == Int(day)
				})
				result.append(contentsOf: results)
			}
			return result
		}
		return self
	}
	
	func filterBy(ages: [String]) -> [Event]? {
		if (ages.count > 0) {
			var result: [Event] = []
			ages.forEach { (age) in
				let results = self.filter({ (event) -> Bool in
					return event.age == Int(age)
				})
				result.append(contentsOf: results)
			}
			return result
		}
		return self
	}
	
}

extension Array where Element == Filter {
	func findBy(id: Int) -> [Filter]? {
		return self.filter({ (filter) -> Bool in
			return (filter.id == id)
		})
	}
}
