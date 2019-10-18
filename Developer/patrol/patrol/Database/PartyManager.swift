//
//  PartyManager.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/18.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class PartyManager{
    static let instance = PartyManager()
    func createParty(party : PartyModel,completion:@escaping ()->()){
        let data  =  Data().encodableModel(model: party)?.getJson()
        Database.instance.partys.addDocument(data:data!) { (error) in
            completion()
        }
    }

}
