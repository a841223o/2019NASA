//
//  PartyDetailModelProvider.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class PartyDetailModelProvider {
    var models = [PartyDetailModel]()
    init() {
        setupFakeData()
    }
    
    func setupFakeData(){
        let a = PartyDetailModel.init(userName: "Leo", date: "2019 / 10 / 14", path: "登山口 -> 望高亭 -> 河口湖")
        let b = PartyDetailModel.init(userName: "Vivian", date: "2019 / 10 / 12", path: "登山口 -> 望高亭 -> 小油坑")
        models.append(a)
        models.append(b)
    }
    
}
