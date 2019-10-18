//
//  UserInfoProvider.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import Firebase


class UserInfoProvider {
    var userInfo = UserInfoModel()
    var delegate : ProviderDelegate?
    init() {
    }
    func setupData(){
        UserManager.instance.getUserInfo(uid:Auth.auth().currentUser?.uid ?? "") { (model) in
            self.userInfo = model
            self.delegate?.dataUpdate()
        }
    }
    
    func setupFakeData(){
        userInfo = UserInfoModel.init(name: "leo", content: "平常沒事爬山寫程式", userImageUrl: "", headImageUrl: "")
    }
}
