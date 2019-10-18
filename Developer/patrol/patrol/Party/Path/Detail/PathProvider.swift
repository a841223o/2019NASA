//
//  PathProvider.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/15.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class PathProvider {
    var models = [PathModel]()
    init(){
        setupFakeData()
    }
    func setupFakeData(){
        let a = PathModel()
        a.date = "9:00"
        a.locationName = "登山口"
        a.content = "登山口往森林"
        a.latitude = 25.235566
        a.longitude = 121.412222
        a.height = 22
        a.imageUrl = "https://ichef.bbci.co.uk/news/ws/660/amz/worldservice/live/assets/images/2015/11/19/151119093840_norway_forests2.jpg"
        
        let b = PathModel()
        b.date = "10:00"
        b.locationName = "夢中湖"
        b.content = "風景優美全家大小可以一起來"
        b.latitude = 25.235577
        b.longitude = 121.412226
        b.height = 25
        b.imageUrl = ""
        models.append(a)
        models.append(b)
    }
}
