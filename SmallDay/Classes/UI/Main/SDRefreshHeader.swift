//
//  SDRefreshHeader.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  DIY 自己的下拉刷新动画

import UIKit

class SDRefreshHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        stateLabel!.hidden = true
        lastUpdatedTimeLabel!.hidden = true
        
        let idleImages = NSMutableArray()
        let idImage = UIImage(named: "wnx00")
        idleImages.addObject(idImage!)
        setImages(idleImages as [AnyObject], forState: MJRefreshStateIdle)
        
        let refreshingImages = NSMutableArray()
        let refreshingImage = UIImage(named: "wnx00")!
        refreshingImages.addObject(refreshingImage)
        setImages(refreshingImages as [AnyObject], forState: MJRefreshStatePulling)

        let refreshingStartImages = NSMutableArray()
        for i in 0...11 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            refreshingStartImages.addObject(image!)
        }
        setImages(refreshingStartImages as [AnyObject], forState: MJRefreshStateRefreshing)
     
    }
    
}