//
//  Filter.swift
//  application-festival
//
//  Created by TANDA Léa on 12/02/2018.
//  Copyright © 2018 Gobelins. All rights reserved.
//

import Foundation

class Filter: Decodable {
	var id: Int?
	var name: String?
	var imageIndex: Int?
	var filterType: String?
	var isSelected = false
	var filterValue: String?
}
