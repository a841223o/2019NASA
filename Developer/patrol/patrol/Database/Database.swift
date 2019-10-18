//
//  Database.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import FirebaseFirestore
class Database {
    static let instance = Database()
    let firestore = Firestore.firestore()
    let users : CollectionReference
    let partys : CollectionReference
    private init(){
        users = firestore.collection("users")
        partys = firestore.collection("partys")
    }
}
