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
	var startingDate: DateEvents;
	var endingDate: DateEvents;
	var link: String?;
	var director: String?;
	var producer: String?;
	var age: Int?;
	
	required init?(coder aDecoder: NSCoder) {
		self.id = aDecoder.decodeObject(forKey: "id") as! Int?
		self.name = aDecoder.decodeObject(forKey: "name") as! String?
		self.excerpt = aDecoder.decodeObject(forKey: "excerpt") as! String?
		self.place = aDecoder.decodeObject(forKey: "place") as! Place?
		self.category = aDecoder.decodeObject(forKey: "category") as! String?
		self.startingDate = aDecoder.decodeObject(forKey: "startingDate") as! DateEvents
		self.endingDate = aDecoder.decodeObject(forKey: "endingDate") as! DateEvents
		self.link = aDecoder.decodeObject(forKey: "link") as! String?
		self.director = aDecoder.decodeObject(forKey: "director") as! String?
		self.producer = aDecoder.decodeObject(forKey: "producer") as! String?
		self.age = aDecoder.decodeObject(forKey: "age") as! Int?
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(id, forKey: "id")
		aCoder.encode(name, forKey: "name")
		aCoder.encode(excerpt, forKey: "excerpt")
		aCoder.encode(place, forKey: "place")
		aCoder.encode(category, forKey: "category")
		aCoder.encode(startingDate, forKey: "startingDate")
		aCoder.encode(endingDate, forKey: "endingDate")
		aCoder.encode(link, forKey: "link")
		aCoder.encode(director, forKey: "director")
		aCoder.encode(producer, forKey: "producer")
		aCoder.encode(age, forKey: "age")
	}
	
	func getDuration() -> String {
		let eventStartingDate = startingDate.getDateEvents()
		let eventEndingDate = endingDate.getDateEvents()
		let calendar = Calendar.current
		let components = calendar.dateComponents([.hour , .minute], from: eventStartingDate, to: eventEndingDate)
		var minutes : String = "";
		if(components.minute != nil &&  components.minute! < 10) {
			minutes = "0\(components.minute ?? 0)"
		} else {
			minutes = "\(components.minute ?? 0)"
		}
		return "Durée : \(components.hour ?? 0)H\(minutes)"
	}
	
	func getImgName() -> String {
		var imgName : String = "";
		switch category {
		case "Compétition et panorama"?:
			imgName = "competitions_selections"
		case "Séance spéciale"?:
			imgName = "seance_speciale"
		case "Volet professionnel"?:
			imgName = "volet_pro"
		case "Autour des films"?:
			imgName = "autour_films"
		case "Salon des nouvelles écritures"?:
			imgName = "salon_nouvelle_ecriture"
		case "Cube animé"?:
			imgName = "cube_anime"
		case "Focus"?:
			imgName = "focus"
		default:
			imgName = "longs_metrages"
		}
		
		return imgName;
	}
	
	func getHours() -> String {
		return "\(getFullStartingHour()) - \(getFullEndingHour())"
	}
	
	func getFullStartingHour() -> String {
		return "\(startingDate.hour ?? 0)H\(getMinutes(minutes: startingDate.minute))"
	}
	
	func getFullEndingHour() -> String {
		return "\(endingDate.hour ?? 0)H\(getMinutes(minutes: endingDate.minute))"
	}
	
	func getMinutes(minutes: Int) -> String {
		var minutesOutput : String = "";
		if ( minutes < 10) {
			minutesOutput = "0\(minutes)"
		} else {
			minutesOutput = "\(minutes)"
		}
		return minutesOutput;
	}
	
	func getAge() -> String {
		if age == 0 {
			return "Ce programme convient à tous les âges";
		} else {
			return "À partir de \(age ?? 3) ans"
		}
	}
	
	func getDirector() -> String {
		if (director != "") {
			return "Directeur(s): \(director ?? "")"
		} else {
			return "Aucun directeur associé"
		}
	}
	
	func getProducer() -> String {
		if (director != "") {
			return "Producteur(s): \(producer ?? "")"
		} else {
			return "Aucun producteur associé"
		}
	}
	
	func getDescription() -> String {
		if(excerpt != "" ) {
			return excerpt!
		} else {
			return "Pas d'informations supplémentaires"
		}
	}
	
	func getExcerpt() -> String {
		if(excerpt != "" ) {
			return excerpt!
		} else {
			return "Pas d'informations supplémentaires"
		}
	}
	
	func getTitle() -> String {
		
		return (name?.uppercased())!
	}
	
	func getCategory() -> String {
		return (category?.uppercased())!
	}
}

