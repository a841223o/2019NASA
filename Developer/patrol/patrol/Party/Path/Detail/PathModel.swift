//
//  PathModel.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/15.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation


class PathModel {
    var date : String
    var content : String
    var latitude : Double
    var longitude : Double
    var locationName : String
    var imageUrl : String
    var height : Int
    
    init() {
        date = ""
        content = ""
        latitude = 121
        longitude = 25
        locationName = ""
        imageUrl = ""
        height = 0
    }
    
    func getTitle()->String{
        return date + " " + locationName
    }
    
    func getInfo()->String{
        return "(\(latitude) N,\(longitude) E) \(height)m H"
    }
    
}
