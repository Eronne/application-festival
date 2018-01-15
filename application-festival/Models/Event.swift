//
//  Events.swift
//  application-festival
//
//  Created by Erwann Letue on 16/01/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class Event: Decodable {
	var id: Int?;
	var name: String?;
	var excerpt: String?;
	var placeIds: [Int]?;
	var categoryId: Int?;
	var startingDate: [String: Int]?;
	var endingDate: [String: Int]?;
}
