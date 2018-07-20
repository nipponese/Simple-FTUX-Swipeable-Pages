//
//  AppDelegate.swift
//  Simple FTUX Swipeable Pages
//
//  Created by Noah Tsutsui on 7/20/18.
//  Copyright © 2018 Noah Tsutsui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let swipingViewController = SwipingViewController(collectionViewLayout: layout)
        
        window?.rootViewController = swipingViewController
        return true
    }
}
