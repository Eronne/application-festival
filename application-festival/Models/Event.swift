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
	var place: Place?;
	var category: String?;
	var img: String?;
	var startingDate: DateEvents;
	var endingDate: DateEvents;
	var duration: Duration?;
}

class Duration: Decodable {
	var hour: Int?;
	var minute: Int?;
}

