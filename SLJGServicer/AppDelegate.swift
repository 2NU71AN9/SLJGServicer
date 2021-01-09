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

    let appkey = "3f630eb745c69f0dcf56ee54"
    let appSecret = "eb89a20364a362aa9781fad1"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = SLJGServicer.shared
            .registAnalytics(appkey)
            .registShare(appKey: appkey, universalLink: "", wechatAppId: "", wechatAppSecret: "")
            .registPush(appKey: appkey, launchOptions: launchOptions)
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        SLJGServicer.shared.registDeviceToken(deviceToken)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if SLJGServicer.shared.handleOpenURL(url: url, options: options) == false {
            // 其他SDK的回调
        }
        return true
    }
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if SLJGServicer.shared.handleUniversalLink(url: userActivity.webpageURL) == false {
            // 其他SDK的回调
        }
        return true
    }
}

