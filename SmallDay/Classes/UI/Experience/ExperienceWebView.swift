//
//  ExperienceWebView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验详情WebView

import UIKit

class ExperienceWebView: UIWebView {
    
    init(frame: CGRect, webViewDelegate: UIWebViewDelegate?, webViewScrollViewDelegate: UIScrollViewDelegate?) {
        super.init(frame: frame)
    
        let contentH: CGFloat = DetailViewController_TopImageView_Height - 20
        scrollView.contentInset = UIEdgeInsets(top:  contentH, left: 0, bottom: 49, right: 0)
        
        scrollView.showsHorizontalScrollIndicator = false
        delegate = webViewDelegate
        scrollView.delegate = webViewScrollViewDelegate
        backgroundColor = theme.SDWebViewBacagroundColor
        scrollView.contentSize.width = AppWidth
        paginationBreakingMode = UIWebPaginationBreakingMode.Column
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
