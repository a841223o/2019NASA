//
//  UserEditViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/18.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit
import Firebase
class UserEditViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    
    var provider : UserInfoProvider?
    let editInfoModel = UserInfoModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup(){
        name.text = provider?.userInfo.name
        info.text = provider?.userInfo.content
    }
    
    @IBAction func update(_ sender: Any) {
        let user = getCurrentUser()
        editInfoModel.name =  name.text ?? ""
        editInfoModel.content = info.text ?? ""
        editInfoModel.headImageUrl = provider?.userInfo.headImageUrl ?? ""
        editInfoModel.userImageUrl = provider?.userInfo.userImageUrl ?? ""
        
        UserManager.instance.Update(uid: user?.uid ?? "" , userInfo: editInfoModel) {
            self.provider?.setupData()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
