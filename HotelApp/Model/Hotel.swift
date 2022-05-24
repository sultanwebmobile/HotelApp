//
//  Hotel.swift
//  HotelApp
//
//  

//

import UIKit

class Hotel: NSObject {
    
    var name: String?
    var imageName: String?
    var price: Int?
    var number_of_stars: Int?
    var hotel_description: String?
    
    init(name: String?,imageName: String?,price: Int?,number_of_stars: Int?,hotel_description: String?) {
        super.init()
        self.name = name
        self.imageName = imageName
        self.price = price
        self.number_of_stars = number_of_stars
        self.hotel_description = hotel_description
    }
    
}
