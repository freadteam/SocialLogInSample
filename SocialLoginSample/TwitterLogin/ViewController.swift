    //
    //  ViewController.swift
    //  SocialLoginSample
    //
    //  Created by Ryo Endo on 2018/11/28.
    //  Copyright © 2018 Ryo Endo. All rights reserved.
    //
    
    import UIKit
    import TwitterKit
    import FirebaseAuth
    
    class ViewController: UIViewController{
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setLoginButtonWithTwitter()
        }
        
        func setLoginButtonWithTwitter() {
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
                if (session != nil) {
                    let authToken = session?.authToken
                    let authTokenSecret = session?.authTokenSecret
                    let credential = TwitterAuthProvider.credential(withToken: authToken!, secret: authTokenSecret!)
                    print(authToken, authTokenSecret, credential)
                    Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                        if let error = error {
                            print("error: \(String(describing: error.localizedDescription))")
                            return
                        } else {
                            //ログイン成功
                            self.successLogin()
                        }
                    }
                } else {
                    print("error: \(String(describing: error?.localizedDescription))");
                }
            })
            
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }
        
    }
