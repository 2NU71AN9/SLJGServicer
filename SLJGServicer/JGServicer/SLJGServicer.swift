//
//  SLJGServicer.swift
//  SLJGServicer
//
//  Created by 孙梁 on 2021/1/8.
//

import UIKit
/**
 1. 添加URL Schemes jiguang jiguang-AppKey
 2. 头文件
     // #import <UIKit/UIKit.h>
     // 引入JAnalytics功能所需头文件
     #import "JANALYTICSService.h"
     // 如果需要使用idfa功能所需要引入的头文件（可选）
     #import <AdSupport/AdSupport.h>
 */
public class SLJGServicer: NSObject, JGAnalyticsProtocol {
    
    static let shared = SLJGServicer()
    private override init() { super.init() }
    
    /// 注册友盟
    /// - Parameter appKey: AppKey
    func regist(_ appKey: String) -> SLJGServicer {
        return self
    }
}

extension SLJGServicer {
    @objc func handleOpenURL(url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        JANALYTICSService.handle(url)
    }
}
