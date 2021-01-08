//
//  AppDelegate.swift
//  SLJGServicer
//
//  Created by 孙梁 on 2021/1/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let appkey = "b73e02f4f8fdc7b3f9cd665f"
    let appSecret = "2de8d4d474b809af7724c72b"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = SLJGServicer.shared.registAnalytics(appkey)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if SLJGServicer.shared.handleOpenURL(url: url, options: options) == false {
            // 其他SDK的回调
        }
        return true
    }
}

