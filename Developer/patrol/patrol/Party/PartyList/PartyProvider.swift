//
//  PartyProvider.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class PartyProvider {
    var partys = [PartyModel]()
    init() {
        setupFakeData()
    }
    
    func setupFakeData(){
        let a = PartyModel.init(name: "陽明山森林公園", owner: "leo134")
        let b = PartyModel.init(name: "玉山森林公園", owner: "leo134")
        a.imageUrl = "https://www.taiwan.net.tw/userfiles/image/2017tour/tour%20bus/Yangmingshan.jpg"
        b.imageUrl = "https://storage.googleapis.com/futurecity-cms-cwg-tw/article/201907/article-5d3e7b8ac85de.jpg"
        partys.append(a)
        partys.append(b)
    }
    
}
