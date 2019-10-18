//
//  ForestModel.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/14.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import UIKit
class PartyModel :Codable {
    
    let name : String
    let owner : String
    var imageUrl : String
    var peopleCount : Int = 0
    
    init(name : String , owner : String) {
        self.name = name
        self.owner = owner
        self.imageUrl = ""
    }
}
