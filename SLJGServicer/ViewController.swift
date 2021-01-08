//
//  ViewController.swift
//  SLJGServicer
//
//  Created by 孙梁 on 2021/1/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let message = JSHAREMessage()
        message.text = "123123123123123"
        SLJGServicer.shared.share(message) { (isSuccess) in
            print("分享结果==>(isSuccess)")
        }
    }
}

