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

    let appkey = "99846b6fcc88b4168c3fe69f" //"3f630eb745c69f0dcf56ee54" com.sl.SLJGServicer
    let appSecret = "578613872257ee82cf246697" //"eb89a20364a362aa9781fad1"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = SLJGServicer.shared
            .registAnalytics(appkey)
            .registShare(appKey: appkey, universalLink: "https://bo5k.t4m.cn/myCommProject/", wechatAppId: "wxac7f360237a214cc", wechatAppSecret: "08196524f27704095dbe7ece0d7dc304")
            .registPush(appKey: appkey, launchOptions: launchOptions)
        
        _ = SLUMServicer.shared.regist("5fd97b5f498d9e0d4d90761a")
            .registAnalytics()
            .registShare(wechatAppId: "wxac7f360237a214cc", wechatAppSecret: "08196524f27704095dbe7ece0d7dc304", universalLink: "https://bo5k.t4m.cn/myCommProject/")
            .registPush(launchOptions)
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        SLJGServicer.shared.registDeviceToken(deviceToken)
        SLUMServicer.shared.registDeviceToken(deviceToken)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if SLJGServicer.shared.handleOpenURL(url: url, options: options) == false {
            // 其他SDK的回调
        }
        if SLUMServicer.shared.handleOpenURL(url: url, options: options) == false {
            // 其他SDK的回调
        }
        return true
    }
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if SLJGServicer.shared.handleUniversalLink(url: userActivity.webpageURL) == false {
            // 其他SDK的回调
        }
        if SLUMServicer.shared.handleUniversalLink(activity: userActivity) == false {
            // 其他SDK的回调
        }
        return true
    }
}

