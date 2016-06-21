//
//  AppDelegate.swift
//  FNFoldingTabBar
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        let tabController:FNFoldingTabBarController = FNFoldingTabBarController.init()
        tabController.title = "FNFoldingTabBar"
        tabController.tabBarBgColor = UIColor.clearColor()
        
        let vc0 = ViewController0.init()
        vc0.tabBarItem.title = "0";
        vc0.tabBarItem.image = nil
        
        let vc1 = ViewController1.init()
        vc1.tabBarItem.title = "1";
        vc1.tabBarItem.image = nil
        
        let vc2 = ViewController2.init()
        vc2.tabBarItem.title = "2";
        vc2.tabBarItem.image = nil
        
        let vc3 = ViewController3.init()
        vc3.tabBarItem.title = "3";
        vc3.tabBarItem.image = nil
        
        tabController.fn_viewControllers=[vc0, vc1, vc2, vc3]
        
        let naviController = UINavigationController.init(rootViewController: tabController)
        self.window!.rootViewController = naviController
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

