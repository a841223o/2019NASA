//
//  UserInfoViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/17.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var headImageVeiw: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myPartyBtn: UIButton!
    @IBOutlet weak var myPathBtn: UIButton!
    let provider  = UserInfoProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        provider.delegate = self
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            }
    override func viewWillAppear(_ animated: Bool) {
        provider.setupData()

    }
    
    func setupView(){
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        myPartyBtn.layer.cornerRadius = myPartyBtn.frame.height/3
        myPathBtn.layer.cornerRadius = myPathBtn.frame.height/3
    }
    func setupProfile(){
        userImageView.downloaded(from: provider.userInfo.userImageUrl, contentMode: .scaleToFill)
        headImageVeiw.downloaded(from: provider.userInfo.headImageUrl, contentMode: .scaleToFill)
        content.text = provider.userInfo.content
        name.text = provider.userInfo.name
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? UserEditViewController
        viewController?.provider = provider
    }
}

extension UserInfoViewController : ProviderDelegate {
    func dataUpdate() {
        setupProfile()
    }
    
    
}
