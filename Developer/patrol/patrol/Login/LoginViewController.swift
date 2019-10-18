//
//  LoginViewController.swift
//  patrol
//
//  Created by DOWN LUNYOU on 2019/10/12.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import MapKit
import CoreLocation

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
          // User is signed in.
          // ...
            print("is signed\(Auth.auth().currentUser?.email)")
            self.performSegue(withIdentifier:"Login", sender: nil)
            
        } else {
          // No user is signed in.
          // ...
        }
    }
    

}

extension LoginViewController : GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
           // ...
           return
         }

         guard let authentication = user.authentication else { return }
         let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
                
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            // ...
            return
          }
            //self.performSegue(withIdentifier:"Login", sender: nil)
            //check is first login
            let auth = Auth.auth().currentUser
            UserManager.instance.checkFirstLogin(uid: Auth.auth().currentUser!.uid, isFirstLogin: {
                
                UserManager.instance.createUser(uid: auth?.uid ?? "" , userInfo: UserInfoModel.init(name: auth?.displayName ?? "", content: "", userImageUrl: auth?.photoURL?.absoluteString ?? "", headImageUrl: "")){
                     self.performSegue(withIdentifier:"Login", sender: nil)
                }
               
            }, isExists: {
                
                self.performSegue(withIdentifier:"Login", sender: nil)
            })
          
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        ()
    }
    
}
