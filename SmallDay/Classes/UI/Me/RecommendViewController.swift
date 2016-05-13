//
//  RecommendViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  应用推荐

import UIKit

class RecommendViewController: UIViewController {
    
    private lazy var webView: UIWebView! = {
        let webView = UIWebView(frame: MainBounds)
        let url = NSURL(string: "itms-apps://itunes.apple.com")!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.delegate = self
        return webView
    }()
    
    private let loadAnimatIV: LoadAnimatImageView! = LoadAnimatImageView.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "应用推荐"
        view.backgroundColor = theme.SDWebViewBacagroundColor
        view.addSubview(webView)
        
    }
    
}

/* 如果要修改成跳转至AppStore应用下载页面

NSString *string = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=自己的appid"];


[[UIApplication sharedApplication] openURL:[NSURL URLWithString: string]]//跳转；

如果要跳转到appstore首页，那么把URL改成：itms-apps://itunes.apple.com就OK了；

[[UIApplication sharedApplication] openURL:[NSURL URLWithString: itms-apps://itunes.apple.com]]

*/

extension RecommendViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadAnimatIV.startLoadAnimatImageViewInView(view, center: view.center)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadAnimatIV.stopLoadAnimatImageView()
    }
    
}