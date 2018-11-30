//
//  LogoutViewController.swift
//  SocialLoginSample
//
//  Created by Ryo Endo on 2018/11/30.
//  Copyright © 2018 Ryo Endo. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logouButton() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.successLogout()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
