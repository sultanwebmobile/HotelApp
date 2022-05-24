//
//  City.swift
//  HotelApp
//


//

import UIKit

class City: NSObject {
    var name: String?
    var imageName: String?
    
     init(name: String?,imageName: String?) {
        super.init()
        self.name = name
        self.imageName = imageName
    }

}
