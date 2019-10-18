//
//  UserManager.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
class UserManager {
    static let instance = UserManager()
    
    func createUser(uid : String,userInfo : UserInfoModel,completion:@escaping ()->()){
        let data  =  Data().encodableModel(model: userInfo)?.getJson()
        Database.instance.users.document(uid).setData(data!) { (error) in
            completion()
        }
    }
    
    func getUserInfo(uid : String , completion : @escaping (UserInfoModel)->()){
        Database.instance.users.document(uid).getDocument {
            (document , error) in
            if let document = document, document.exists {
                let userInfoModel = Data().decodableJson(jsonObject: document.data()!, model: UserInfoModel.self )
                completion(userInfoModel!)
            }
        }
    }
    
    func checkFirstLogin(uid : String ,isFirstLogin :@escaping ()->(),isExists:@escaping ()->()){
        Database.instance.users.document(uid).getDocument { (document, error) in
            if let document = document , document.exists {
                //user is exist
                isExists()
            }else{
                //user is first ligin
                isFirstLogin()
            }
        }
    }
    
    
    func Update(uid :String , userInfo : UserInfoModel , completion : @escaping ()->()){
        let data = Data().encodableModel(model: userInfo)?.getJson()
        Database.instance.users.document(uid).updateData(data!) { (error) in
            if error == nil {
                completion()
            }else{
                print(error)
            }
        }
    }
    
    
}
