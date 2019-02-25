//
//  AuthFunction.swift
//  SocialLoginSample
//
//  Created by Ryo Endo on 2018/11/30.
//  Copyright © 2018 Ryo Endo. All rights reserved.
//

import UIKit
import FirebaseAuth

extension UIViewController {
    
    func successLogin() {
        var window: UIWindow?
        //ログイン中なら
        let storyboard = UIStoryboard(name: "Logout", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogoutController")
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
    }
    func successLogout() {
        var window: UIWindow?
        //ログインしていないなら
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLoginController")
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
    
}
