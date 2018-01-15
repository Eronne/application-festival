//
//  DataMapper.swift
//  application-festival
//
//  Created by Erwann Letue on 15/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class DataMapper {
	var places: [Place]{
		get{
			guard let filePath = Bundle.main.url(forResource: "places", withExtension: "json") else {
				return []
			}
			let data = try! Data(contentsOf: filePath);
			return try! JSONDecoder().decode([Place].self, from: data)
		}
	}
}
