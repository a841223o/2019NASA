//
//  CommentsProvider.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/16.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class CommtentsProvider {
    var models = [CommentModel]()
    
    init(){
        setupFakeData()
    }
    
    func setupFakeData(){
        let a = CommentModel.init(user: "sdfsdfd", name: "Leo", imageUrl: "https://avatarsed1.serversdev.getgo.com/2205256774854474505_medium.jpg", date: "2019/10/19 10:20", content: "行程很棒")
        let b = CommentModel.init(user: "sdfsdfd", name: "amy", imageUrl: "https://avatarsed1.serversdev.getgo.com/2205256774854474505_medium.jpg", date: "2019/10/19 9:08", content: "行程很棒 很多有用的資訊")
        let c = CommentModel.init(user: "sdfsdfd", name: "Dee", imageUrl: "https://avatarsed1.serversdev.getgo.com/2205256774854474505_medium.jpg", date: "2019/10/19 7:13", content: "行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊行程很棒 很多有用的資訊")
        
        models.append(a)
        models.append(b)
        models.append(c)
    }
}
