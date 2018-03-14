//
//  DataMapper.swift
//  application-festival
//
//  Created by Erwann Letue on 15/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class DataMapper {
	
	let defaults = UserDefaults.standard //can save data of the user
	
	func saveFav(favorites: [Event]) {
		let data = NSKeyedArchiver.archivedData(withRootObject: favorites)
		defaults.set(data, forKey: "favorites")
	}
	
	func getFav() -> [Event] {
		guard let datas = defaults.data(forKey: "favorites") else { return [] }
		return NSKeyedUnarchiver.unarchiveObject(with: datas) as! [Event]
	}
	
	func addFav(event: Event) {
		var favorites = getFav()
		favorites.append(event)
		saveFav(favorites: favorites)
		print(favorites)
	}
	
	func removeFav(event: Event) {
		let favorites = getFav().filter { (e) -> Bool in
			return e.id != event.id
		}
		saveFav(favorites: favorites)
	}
	
	func isFav(event: Event) -> Bool {
		if (getFav().count == 0) {
			return false
		}
		return getFav().filter({
			(e) -> Bool in
				e.id == event.id
			}).count > 0
	}
	
	var events: [Event] {
		get{
			guard let filePath = Bundle.main.url(forResource: "events", withExtension: "json") else {
				return []
			}
			let data = try! Data(contentsOf: filePath);
			return try! JSONDecoder().decode([Event].self, from: data);
		}
	}
	
	var filters: [Filter]{
		get {
			guard let filePath = Bundle.main.url(forResource: "filters", withExtension: "json") else {
				return []
			}
			let data = try! Data(contentsOf: filePath);
			return try! JSONDecoder().decode([Filter].self, from: data);
		}
	}
}
