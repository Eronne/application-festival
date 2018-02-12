//
//  DataMapper.swift
//  application-festival
//
//  Created by Erwann Letue on 15/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class DataMapper {
	var categories: [Category]{
		get{
			guard let filePath = Bundle.main.url(forResource: "categories", withExtension: "json") else {
				return []
			}
			let data = try! Data(contentsOf:filePath);
			return try! JSONDecoder().decode([Category].self, from: data);
		}
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
	
	var places: [Place]{
		get{
			guard let filePath = Bundle.main.url(forResource: "places", withExtension: "json") else {
				return []
			}
			let data = try! Data(contentsOf: filePath);
			return try! JSONDecoder().decode([Place].self, from: data);
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
