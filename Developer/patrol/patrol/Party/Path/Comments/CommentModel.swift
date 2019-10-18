//
//  CommentModel.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/16.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation

class CommentModel {
    let user : String
    let userName : String
    let userImageUrl : String
    let date : String
    let content : String
    init(user : String , name:String , imageUrl : String , date : String , content : String ){
        self.user = user
        self.userName = name
        self.userImageUrl = imageUrl
        self.date = date
        self.content = content
    }
}
