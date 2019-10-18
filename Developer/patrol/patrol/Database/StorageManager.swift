//
//  StorageManager.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/18.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageManager {
    static let instance = StorageManager()
    let storageRef = Storage.storage().reference()
    func uploadImage(child : String ,uid : String, image : UIImage , completion:@escaping (URL)->()){
        let storageRef = Storage.storage().reference().child(child).child("\(uid).png")
        let uploadData = image.pngData()
        storageRef.putData(uploadData!, metadata: nil, completion: { (data, error) in
            if error != nil {
                // 若有接收到錯誤，我們就直接印在 Console 就好，在這邊就不另外做處理。
                print("Error: \(error!.localizedDescription)")
                return
            }
            storageRef.downloadURL(completion: { (url, error) in
                if error == nil {
                    completion(url!)
                }
            })
        })
        
    }
}
