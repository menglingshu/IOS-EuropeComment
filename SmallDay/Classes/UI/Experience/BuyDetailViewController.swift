//
//  BuyDetailViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验页的购买详情

import UIKit

class BuyDetailViewController: UIViewController {
    
    private lazy var webView: UIWebView = {
        let web = UIWebView(frame: CGRectMake(0, 0, AppWidth, AppHeight - NavigationH))
        web.backgroundColor = theme.SDBackgroundColor
        web.scrollView.showsHorizontalScrollIndicator = false
        return web
        }()
    
    var htmlStr: String? {
        didSet {
            let newStr = NSMutableString.changeHeigthAndWidthWithSrting(NSMutableString(string: htmlStr!))
            self.webView.loadHTMLString(newStr as String, baseURL: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "购买须知"
        
        view.addSubview(webView)
    }
}
