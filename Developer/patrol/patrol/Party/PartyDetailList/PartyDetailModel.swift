//
//  PartyDetailModel.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class PartyDetailModel  {
    var imageUrl : String
    let date : String
    let path : String
    let userName : String
    
    init(userName :String,date : String , path : String) {
        self.date = date
        self.path = path
        self.userName = userName
        imageUrl = ""
    }
}
