//
//  AddNewPartyViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/18.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import UIKit
class AddNewPartyViewController : UIViewController {
    
    
    @IBOutlet weak var haedImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    let imagePickerController = UIImagePickerController()
    var imageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        haedImageView.contentMode = .scaleAspectFill
        imagePickerController.delegate = self
        navigationController?.delegate = self
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func ToPhoto(_ sender: UIButton) {
     
             // 設定 UIAlertController 的標題與樣式為 動作清單 (actionSheet)
             let imagePickerAlertController = UIAlertController(title: "上傳圖片", message: "請選擇要上傳的圖片", preferredStyle: .actionSheet)
        
             // 建立三個 UIAlertAction 的實體
             // 新增 UIAlertAction 在 UIAlertController actionSheet 的 動作 (action) 與標題
             let imageFromLibAction = UIAlertAction(title: "照片圖庫", style: .default) { (Void) in
        
                 // 判斷是否可以從照片圖庫取得照片來源
                 if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        
                     // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.photoLibrary)，並 present UIImagePickerController
                    self.imagePickerController.sourceType = .photoLibrary
                    self.present(self.imagePickerController, animated: true, completion: nil)
                 }
             }
             let imageFromCameraAction = UIAlertAction(title: "相機", style: .default) { (Void) in
        
                 // 判斷是否可以從相機取得照片來源
                 if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
                     // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.camera)，並 present UIImagePickerController
                    self.imagePickerController.sourceType = .camera
                    self.present(self.imagePickerController, animated: true, completion: nil)
                 }
             }
        
             // 新增一個取消動作，讓使用者可以跳出 UIAlertController
             let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (Void) in
        
                 imagePickerAlertController.dismiss(animated: true, completion: nil)
             }
        
             // 將上面三個 UIAlertAction 動作加入 UIAlertController
             imagePickerAlertController.addAction(imageFromLibAction)
             imagePickerAlertController.addAction(imageFromCameraAction)
             imagePickerAlertController.addAction(cancelAction)
        
             // 當使用者按下 uploadBtnAction 時會 present 剛剛建立好的三個 UIAlertAction 動作與
             present(imagePickerAlertController, animated: true, completion: nil)
    }
    
    
    @IBAction func AddNewParty(_ sender: UIButton) {
        guard let name = nameField.text else {
            return
        }
        
        let party : PartyModel = PartyModel.init(name: name, owner: getCurrentUser()?.uid ?? "")
        if imageName == "" {
            PartyManager.instance.createParty(party: party) {
                ()
            }
        }else{
            StorageManager.instance.uploadImage(child: "partys", uid: imageName, image: haedImageView.image!) { (url) in
                party.imageUrl = url.absoluteString
                PartyManager.instance.createParty(party: party) {
                    ()
                }
            }
        }
    }
}

extension AddNewPartyViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        // 取得從 UIImagePickerController 選擇的檔案
        if let pickedImage = info[.originalImage] as? UIImage {
            haedImageView.image = pickedImage
            //get uuid
            imageName = NSUUID().uuidString
        }
                 
        picker.dismiss(animated: true, completion: nil)
    }
    
}
