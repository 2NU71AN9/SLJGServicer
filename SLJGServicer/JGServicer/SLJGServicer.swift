//
//  SLJGServicer.swift
//  SLJGServicer
//
//  Created by 孙梁 on 2021/1/8.
//

import UIKit
/**
 添加URL Schemes jiguang jiguang-AppKey
 */
public class SLJGServicer: NSObject, JGAnalyticsProtocol, JGShareProtocol {
    
    static let shared = SLJGServicer()
    private override init() { super.init() }
    
    /// 注册极光
    /// - Parameter appKey: AppKey
    func regist(_ appKey: String) -> SLJGServicer {
        return self
    }
}

extension SLJGServicer {
    @objc func handleOpenURL(url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        JANALYTICSService.handle(url) || JSHAREService.handleOpen(url)
    }
    @objc func handleUniversalLink(url: URL?) -> Bool {
        JSHAREService.handleOpen(url)
    }
}
