//
//  ViewControllerExtension.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/18.
//  Copyright © 2019 Leo. All rights reserved.
//

import Foundation
import UIKit
import Firebase
extension UIViewController {
    func getCurrentUser()->User?{
       return Auth.auth().currentUser
    }
}
