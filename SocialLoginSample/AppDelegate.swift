//
//  AppDelegate.swift
//  SocialLoginSample
//
//  Created by Ryo Endo on 2018/11/28.
//  Copyright © 2018 Ryo Endo. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Twitter (infp.plistnにキーの追加も忘れずに)
        TWTRTwitter.sharedInstance().start(withConsumerKey: APIKey.withConsumerKey,consumerSecret: APIKey.consumerSecret)
       
        //firebase
        FirebaseApp.configure()
        
        if TWTRTwitter.sharedInstance().sessionStore.session() != nil {
            self.loginFunction()
        } else {
            self.logoutFunction()
        }
        
        return true
    }
    
    //twitterlログイン後、Handling Log in Redirect
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
        }
        return false
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func loginFunction() {
        //ログイン中なら
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Logout", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogoutController")
        self.window?.rootViewController = rootViewController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }
    
    func logoutFunction() {
        //ログインしていないなら
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLoginController")
        self.window?.rootViewController = rootViewController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }
    
}

