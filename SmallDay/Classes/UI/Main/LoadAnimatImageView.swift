//
//  LoadAnimatImageView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  加载时等待的ImageView动画

import UIKit

class LoadAnimatImageView: NSObject {
    
    private static let sharedInstance = LoadAnimatImageView()
    class var sharedManager : LoadAnimatImageView {
        return sharedInstance
    }
    
    private lazy var loadImageView: UIImageView! = {
        let loadImageView = UIImageView()
        loadImageView.animationImages = self.loadAnimImages!
        loadImageView.animationRepeatCount = 10000
        loadImageView.animationDuration = 1.0
         loadImageView.frame = CGRectMake(0, 0, 44, 51)
        return loadImageView
        }()
    
    private lazy var loadAnimImages: [UIImage]? = {
        var images = [UIImage]()
        for i in 0...11 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            images.append(image!)
        }
        
        return images
        }()
    
    func startLoadAnimatImageViewInView(view: UIView, center: CGPoint)  {

        loadImageView.center = center
        view.addSubview(loadImageView)
        loadImageView.startAnimating()
    }
    
    func stopLoadAnimatImageView() {
        loadImageView.removeFromSuperview()
        loadImageView.stopAnimating()
    }
    
}
