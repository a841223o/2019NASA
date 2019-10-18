//
//  UserInfoModel.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class UserInfoModel : Codable {
    var name : String = ""
    var content : String = ""
    var userImageUrl : String = ""
    var headImageUrl : String = ""
    init() {
        
    }
    init(name : String , content : String , userImageUrl : String , headImageUrl : String) {
        self.name = name
        self.content = content
        self.userImageUrl = userImageUrl
        self.headImageUrl = headImageUrl
    }
    
    
}
