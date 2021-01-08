//
//  JGShareProtocol.swift
//  SLJGServicer
//
//  Created by 孙梁 on 2021/1/8.
//

import UIKit
import PKHUD

public protocol JGShareProtocol {
    /// 注册
    func registShare(appKey: String, universalLink: String, wechatAppId: String, wechatAppSecret: String) -> Self
    /// 获取用户在第三方平台的用户 ID、头像等资料完成账号体系的构建
    func getSocialUserInfo(platform: JSHAREPlatform, complete: @escaping ((JSHARESocialUserInfo?) -> Void))
    /// 分享
    func share(_ message: JSHAREMessage, complete: ((Bool) -> Void)?)
    /// 可以添加各种分享内容的方法
}

public extension JGShareProtocol where Self: SLJGServicer {
    func registShare(appKey: String, universalLink: String, wechatAppId: String, wechatAppSecret: String) -> Self {
        let config = JSHARELaunchConfig()
        config.appKey = appKey
        config.channel = "App Store"
        config.isProduction = true
        #if DEBUG
        config.isProduction = false
        #endif
        config.weChatAppId = wechatAppId
        config.weChatAppSecret = wechatAppSecret
        config.jChatProAuth = ""
        config.universalLink = universalLink
        JSHAREService.setup(with: config)
        #if DEBUG
        JSHAREService.setDebug(true)
        #endif
        return self
    }
    
    func getSocialUserInfo(platform: JSHAREPlatform, complete: @escaping ((JSHARESocialUserInfo?) -> Void)) {
        JSHAREService.getSocialUserInfo(platform) { (userinfo, _) in
            complete(userinfo)
        }
    }
    
    func share(_ message: JSHAREMessage, complete: ((Bool) -> Void)?) {
        
        func share() {
            JSHAREService.share(message) { (state, error) in
                HUD.flash(.label(state == .success ? "分享成功" : "分享失败"), delay: 1.5, completion: nil)
                complete?(state == .success)
            }
        }
        
        if message.platform.rawValue != 0 {
            share()
        } else {
            JGSharePlatformPicker { platform in
                message.platform = platform
                share()
            }.show()
        }
    }
}
